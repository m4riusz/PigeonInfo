//
//  DepartmentListCoordinator.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 18/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

protocol DepartmentListCoordinatorProtocol {
}

final class DepartmentListCoordinator: CoordinatorProtocol {
    private lazy var departmentListController = DepartmentListController().then {
        let districtRepository = DistrictRepository(local: DistrictLocalDataSource(),
                                                    remote: DistrictRemoteDataSource())
        let departmentRepository = DepartmentRepository(local: DepartmentLocalDataSource(),
                                                        remote: DepartmentRemoteDataSource())
        let useCase = DepartmentListUseCase(districtRepository: districtRepository,
                                            departmentRepository: departmentRepository)
        $0.viewModel = DepartmentListViewModel(useCase: useCase)
        $0.viewModel.coordinator = self
    }
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.viewControllers = [departmentListController]
    }
}

extension DepartmentListCoordinator: DepartmentListCoordinatorProtocol {
    
}
