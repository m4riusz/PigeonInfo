//
//  DepartmentCollectionViewHeader.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 24/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

final class DepartmentCollectionViewHeader: UICollectionReusableView {
    private lazy var nameLabel = Label().then {
        $0.textSize = .huge
        $0.textWeight = .semibold
        $0.textColor = R.color.primary_text()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Spacings.small)
            $0.left.equalToSuperview().offset(Spacings.small)
            $0.right.equalToSuperview().offset(-Spacings.small)
            $0.bottom.equalToSuperview().offset(-Spacings.small)
        }
    }
    
    func update(_ item: District) {
        nameLabel.text = item.name
    }
}
