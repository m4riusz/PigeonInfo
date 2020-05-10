//
//  DepartmentListCoordinator.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 18/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit
import Moya

protocol DepartmentListCoordinatorProtocol {
}

final class DepartmentListCoordinator: CoordinatorProtocol {
    private lazy var departmentListController = DepartmentListController().then {
        let moyaProvider: MoyaProvider<PigeonInfo> = .init(stubClosure: MoyaProvider<PigeonInfo>.delayedStub(1))
        let context = CoreDataStack().persistentContainer.viewContext
        let districtRepository = DistrictRepository(local: DistrictLocalDataSource(context: context),
                                                    remote: DistrictRemoteDataSource(moyaProvider: moyaProvider))
        let departmentRepository = DepartmentRepository(local: DepartmentLocalDataSource(context: context),
                                                        remote: DepartmentRemoteDataSource(moyaProvider: moyaProvider))
        let versionRepository = VersionRepository(local: VersionLocalDataSource(context: context),
                                                  remote: VersionRemoteDataSource(moyaProvider: moyaProvider))
        let useCase = DepartmentListUseCase(districtRepository: districtRepository,
                                            departmentRepository: departmentRepository,
                                            versionRepository: versionRepository)
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
