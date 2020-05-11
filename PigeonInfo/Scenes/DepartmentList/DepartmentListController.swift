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
import Toast

final class DepartmentListController: UIViewController {
    private lazy var searchNavigationView = SearchNavigationView().then {
        $0.title = R.string.localizable.departments()
        $0.roundedBottomCorners()
        $0.addShadow()
    }
    private lazy var flowLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: view.frame.width,
                             height: 50)
        $0.headerReferenceSize = CGSize(width: view.frame.width,
                                        height: 40)
        $0.sectionHeadersPinToVisibleBounds = true
    }
    private lazy var collectionView = UICollectionView(flowLayout).then {
        $0.backgroundColor = .clear
        $0.backgroundView = EmptyView().then {
            $0.title = R.string.localizable.no_data()
        }
        $0.refreshControl = UIRefreshControl()
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
        view.bringSubviewToFront(searchNavigationView)
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
        let viewDidLoadTrigger = rx.methodInvoked(#selector(viewWillAppear(_:)))
            .mapToVoid()
        
        let pullToRefresh = collectionView.refreshControl!.rx
            .controlEvent(.valueChanged)
            .mapToVoid()
        
        let refreshTrigger = Observable.merge(viewDidLoadTrigger, pullToRefresh)
            .asDriverOnErrorJustComplete()
        
        let query = searchNavigationView.query
            .throttle(.milliseconds(200))
        
        let output = viewModel.transform(input: .init(refreshTrigger: refreshTrigger,
                                                      query: query))
        output.items
            .do(onNext: { [weak self] items in
                self?.collectionView.backgroundView?.isHidden = !items.isEmpty
            })
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
        
        output.refreshing
            .drive(onNext: { [weak self] refreshing in
                let refreshControl = self?.collectionView.refreshControl
                refreshing ? refreshControl?.beginRefreshing() : refreshControl?.endRefreshing()
            })
            .disposed(by: disposeBag)
        
        output.error
            .drive(onNext: { error in
                print(error)
            })
            .disposed(by: disposeBag)
        
        output.other
            .drive()
            .disposed(by: disposeBag)
    }
}
