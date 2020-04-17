//
//  CoordinatorProtocol.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation

protocol CoordinatorProtocol: class {
    var childCoordinators: [CoordinatorProtocol] { get set }
    
    func start()
}

extension CoordinatorProtocol {

    func store(coordinator: CoordinatorProtocol) {
        childCoordinators.append(coordinator)
    }

    func free(coordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
