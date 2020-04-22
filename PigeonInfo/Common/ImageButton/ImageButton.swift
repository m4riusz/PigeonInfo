//
//  ImageButton.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

final class ImageButton: BaseView {
    private lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    private lazy var titleLabel = UILabel().then {
        $0.textAlignment = .center
    }
    private lazy var tapGesture = UITapGestureRecognizer()
    var title: String? {
        didSet { titleLabel.text = title }
    }
    var normalImage: UIImage? {
        didSet { updateForState() }
    }
    var selectedImage: UIImage? {
        didSet { updateForState() }
    }
    var isSelected: Bool = false {
        didSet { updateForState() }
    }
    var normalColor: UIColor? {
        didSet { updateForState() }
    }
    var selectedColor: UIColor? {
        didSet { updateForState() }
    }
    var tap: Driver<Void> {
        return tapGesture.rx
            .event
            .flatMapLatest { _ in Observable<Void>.just(()) }
            .asDriver(onErrorJustReturn: ())
    }
    
    override func setup() {
        self.backgroundColor = .clear
        self.addGestureRecognizer(tapGesture)
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(Spacings.small)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func updateForState() {
        imageView.image = isSelected ? selectedImage ?? normalImage : normalImage
        imageView.tintColor = isSelected ? selectedColor : normalColor
        titleLabel.textColor = isSelected ? selectedColor : normalColor
    }
}
