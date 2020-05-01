//
//  RswiftExtension.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 22/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit
import Rswift

extension Rswift.ImageResource {
    func template() -> UIImage {
        return UIImage(named: name, in: bundle, with: nil)!
            .withRenderingMode(.alwaysTemplate)
    }
}
