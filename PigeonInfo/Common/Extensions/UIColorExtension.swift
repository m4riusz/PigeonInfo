//
//  UIColorExtension.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 11/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

extension UIColor {
    static func generateColorFor(text: String) -> UIColor {
        var hash = 0
        let colorConstant = 131
        let maxSafeValue = Int.max / colorConstant
        for char in text.unicodeScalars{
            if hash > maxSafeValue {
                hash = hash / colorConstant
            }
            hash = Int(char.value) + ((hash << 5) - hash)
        }
        let finalHash = abs(hash) % (256*256*256);
        let color = UIColor(red: CGFloat((finalHash & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((finalHash & 0xFF00) >> 8) / 255.0,
                            blue: CGFloat((finalHash & 0xFF)) / 255.0,
                            alpha: 1.0)
        return color
    }
}
