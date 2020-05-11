//
//  EmptyView.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 11/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

final class EmptyView: BaseView {
    private lazy var textLabel = Label().then {
        $0.textSize = .big
        $0.textColor = R.color.primary_text()
        $0.textWeight = .medium
    }
    var title: String? {
        willSet { textLabel.text = newValue }
    }
    
    override func setup() {
        backgroundColor = .clear
        addSubview(textLabel)
        
        textLabel.snp.makeConstraints {
            $0.top.greaterThanOrEqualToSuperview()
            $0.left.greaterThanOrEqualToSuperview()
            $0.right.lessThanOrEqualToSuperview()
            $0.bottom.lessThanOrEqualToSuperview()
            $0.center.equalToSuperview()
        }
    }
}
