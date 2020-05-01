//
//  Label.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 22/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit


final class Label: UILabel {
    var textSize: TextSize = .normal {
        didSet { update() }
    }
    var textWeight: UIFont.Weight = .regular {
        didSet { update() }
    }

    private func update() {
        font = .systemFont(ofSize: textSize.rawValue,
                           weight: textWeight)
    }
}
