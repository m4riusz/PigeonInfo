//
//  DepartmentCollectionViewCell.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 22/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

final class DepartmentCollectionViewCell: UICollectionViewCell {
    private lazy var numberLabel = Label().then {
        $0.textSize = .big
        $0.textWeight = .semibold
        $0.textColor = R.color.primary_text()
    }
    private lazy var nameLabel = Label().then {
        $0.textSize = .normal
        $0.textWeight = .regular
        $0.textColor = R.color.secondary_text()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.addSubview(numberLabel)
        contentView.addSubview(nameLabel)
        
        numberLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Spacings.small)
            $0.left.equalToSuperview().offset(Spacings.small)
            $0.bottom.equalToSuperview().offset(-Spacings.small)
            $0.width.equalTo(DepartmentCollectionViewCellStyle.NumberLabel.width)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Spacings.small)
            $0.left.equalTo(numberLabel.snp.right).offset(Spacings.normal)
            $0.right.equalToSuperview().offset(-Spacings.small)
            $0.bottom.equalToSuperview().offset(-Spacings.small)
        }
    }
    
    func update(_ item: DepartmentViewModel) {
        numberLabel.text = item.number
        nameLabel.text = item.name
    }
}
