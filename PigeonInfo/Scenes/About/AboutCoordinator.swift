//
//  AboutCoordinator.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 18/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit
import Then

protocol AboutCoordinatorProtocol {
    
}

final class AboutCoordinator: CoordinatorProtocol {
    private lazy var aboutController = AboutController().then {
        $0.viewModel = AboutViewModel()
        $0.viewModel.coordinator = self
    }
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.viewControllers = [aboutController]
    }
}

extension AboutCoordinator: AboutCoordinatorProtocol {
}
