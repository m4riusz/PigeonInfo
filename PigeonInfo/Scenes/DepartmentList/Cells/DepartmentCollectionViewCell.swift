//
//  DepartmentCollectionViewCell.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 22/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

final class DepartmentCollectionViewCell: UICollectionViewCell {
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .white
        $0.roundAllCorners(radius: DepartmentCollectionViewCellStyle.ContainerView.cornerRadius)
    }
    private lazy var markView = UIView().then {
        $0.backgroundColor = .green
    }
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
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.addSubview(containerView)
        containerView.addSubview(markView)
        containerView.addSubview(numberLabel)
        containerView.addSubview(nameLabel)
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(Spacings.normal)
            $0.right.equalToSuperview().offset(-Spacings.normal)
            $0.bottom.equalToSuperview()
        }
        markView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(DepartmentCollectionViewCellStyle.MarkView.width)
        }
        numberLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Spacings.small)
            $0.left.equalTo(markView.snp.right).offset(Spacings.small)
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
        markView.backgroundColor = item.color
        numberLabel.text = item.number
        nameLabel.text = item.name
    }
}
