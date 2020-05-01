//
//  MainCoordinator.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import UIKit

protocol MainCoordinatorProtocol {
    func goToDepartmentList()
    func goToAbout()
}

final class MainCoordinator: CoordinatorProtocol {
    private lazy var departmentListCoordinator: CoordinatorProtocol = {
        return DepartmentListCoordinator(navigationController: NavigationController())
    }()
    private lazy var aboutCoordinator: CoordinatorProtocol = {
        return AboutCoordinator(navigationController: NavigationController())
    }()
    private lazy var mainController = MainController().then {
        $0.viewModel = MainViewModel()
        $0.viewModel.coordinator = self
    }
    private let window: UIWindow
    var navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = NavigationController()
    }
    
    func start() {
        navigationController.viewControllers = [mainController]
        window.rootViewController = navigationController
    }
}

extension MainCoordinator: MainCoordinatorProtocol {
    func goToDepartmentList() {
        departmentListCoordinator.start()
        mainController.setChild(controller: departmentListCoordinator.navigationController)
    }
    
    func goToAbout() {
        aboutCoordinator.start()
        mainController.setChild(controller: aboutCoordinator.navigationController)
    }
}
