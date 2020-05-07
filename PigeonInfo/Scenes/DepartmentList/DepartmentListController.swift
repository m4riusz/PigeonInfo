//
//  DepartmentListController.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 16/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

final class DepartmentListController: UIViewController {
    private lazy var button = Button().then {
        $0.setImage(R.image.info(), for: .normal)
    }
    
    private lazy var searchNavigationView = SearchNavigationView().then {
        $0.title = R.string.localizable.departments()
        $0.roundedBottomCorners()
        $0.addShadow()
        $0.righItems = [button]
    }
    private lazy var flowLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: view.frame.width,
                             height: 40)
        $0.headerReferenceSize = CGSize(width: view.frame.width,
                                        height: 40)
    }
    private lazy var collectionView = UICollectionView(flowLayout).then {
        $0.backgroundColor = .clear
        $0.registerHeader(DepartmentCollectionViewHeader.self)
        $0.registerCell(DepartmentCollectionViewCell.self)
    }
    private lazy var disposeBag = DisposeBag()
    var viewModel: DepartmentListViewModel!
 
    override func viewDidLoad() {
        view.backgroundColor = R.color.background()
        setupConstraints()
        bindViewModel()
    }
    
    private func setupConstraints() {
        view.addSubview(searchNavigationView)
        view.addSubview(collectionView)
        searchNavigationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchNavigationView.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func bindViewModel() {
        let loadTrigger = rx.methodInvoked(#selector(viewDidLoad))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let query = searchNavigationView.query
        let tmpAction = button.rx.tap.asDriver()
        let output = viewModel.transform(input: .init(loadTrigger: loadTrigger,
                                                      query: query,
                                                      tmpAction: tmpAction))
        
        output.items
            .drive(collectionView.rx.items(dataSource:
                RxCollectionViewSectionedAnimatedDataSource<DepartmentSection>(
                    configureCell: { dataSource, collectionView, indexPath, item in
                        let cell = collectionView.dequeueCell(DepartmentCollectionViewCell.self,
                                                              indexPath: indexPath)
                        cell.update(item)
                        return cell
                }, configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
                    let header = collectionView.dequeueHeader(DepartmentCollectionViewHeader.self,
                                                              indexPath: indexPath)
                    let item = dataSource.sectionModels[indexPath.section]
                    header.update(item)
                    return header
                })))
            .disposed(by: disposeBag)
        
        output.tmp
        .drive()
        .disposed(by: disposeBag)
    }
}
