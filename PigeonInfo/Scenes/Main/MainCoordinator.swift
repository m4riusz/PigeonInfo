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
    private let window: UIWindow
    var childCoordinators: [CoordinatorProtocol] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let controller = MainController()
        controller.viewModel = MainViewModel()
        controller.viewModel.coordinator = self
        self.window.rootViewController = controller
    }
}

extension MainCoordinator: MainCoordinatorProtocol {
    func goToDepartmentList() {
    }
    
    func goToAbout() {
        
    }
}
