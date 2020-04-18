//
//  CoordinatorProtocol.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol: class {
    var navigationController: UINavigationController { get }
    
    func start()
}
