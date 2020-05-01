//
//  UIView.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 22/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

extension UIView {
    func roundedTopCorners(radius: CGFloat = 20) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMinYCorner,
                               .layerMaxXMinYCorner]
    }
    
    func roundedBottomCorners(radius: CGFloat = 20) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMaxYCorner,
                               .layerMaxXMaxYCorner]
    }
    
    func roundAllCorners(radius: CGFloat = 20) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMinYCorner,
                               .layerMaxXMinYCorner,
                               .layerMinXMaxYCorner,
                               .layerMaxXMaxYCorner]
    }
    
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
        layer.masksToBounds = false
    }
}
