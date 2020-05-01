//
//  NavigationView.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

final class NavigationView: BaseView {
    private lazy var leftItemsStackView = UIStackView().then {
        $0.spacing = NavigationViewStyle.LeftItemsStackView.spacing
        $0.distribution = .fillEqually
    }
    private lazy var titleLabel = Label().then {
        $0.textSize = .huge
        $0.textWeight = .medium
        $0.textAlignment = .center
        $0.textColor = R.color.navigation_title()
    }
    private lazy var rightItemsStackView = UIStackView().then {
        $0.spacing = NavigationViewStyle.RightItemsStackView.spacing
        $0.distribution = .fillEqually
    }
    var title: String? {
        willSet { titleLabel.text = newValue }
    }
    var leftItems: [Button] = [] {
        willSet { leftItemsStackView.setArrangedSubviews(newValue) }
    }
    var rightItems: [Button] = [] {
        willSet { rightItemsStackView.setArrangedSubviews(newValue) }
    }
    
    override func setup() {
        backgroundColor = R.color.navigation_background()
        addSubview(leftItemsStackView)
        addSubview(titleLabel)
        addSubview(rightItemsStackView)
        
        leftItemsStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.left.equalTo(safeAreaLayoutGuide.snp.left)
            $0.right.lessThanOrEqualTo(titleLabel.snp.right).offset(-Spacings.small)
            $0.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        rightItemsStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.left.greaterThanOrEqualTo(titleLabel.snp.right).offset(Spacings.normal)
            $0.right.equalTo(safeAreaLayoutGuide.snp.right)
            $0.bottom.equalToSuperview()
        }
    }
}
