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
    private lazy var collectionView = UICollectionView().then {
        $0.backgroundColor = .clear
        $0.registerHeader(DepartmentCollectionViewHeader.self)
        $0.registerCell(DepartmentCollectionViewCell.self)
    }
    var viewModel: DepartmentListViewModel!
 
    override func viewDidLoad() {
        view.backgroundColor = .green
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func bindViewModel() {
        let loadTrigger = self.rx.methodInvoked(#selector(viewDidLoad))
        
        let collectionD = RxCollectionViewSectionedAnimatedDataSource<DepartmentSection>(
            configureCell: { dataSource, collectionView, indexPath, item in
                let cell = collectionView.dequeueCell(DepartmentCollectionViewCell.self,
                                                      indexPath: indexPath)
                
                return cell
        }, configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
            let header = collectionView.dequeueHeader(DepartmentCollectionViewHeader.self,
                                                      indexPath: indexPath)
            return header
        })
    }
}
