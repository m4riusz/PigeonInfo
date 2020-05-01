//
//  UIStackViewExtension.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func setArrangedSubviews(_ views: [UIView]) {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
        views.forEach { addArrangedSubview($0)}
    }
}
