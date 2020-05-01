//
//  MainController.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class MainController: UIViewController {
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    private lazy var bottomBarContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.roundedTopCorners()
        $0.addShadow()
    }
    private lazy var listButton = ImageButton().then {
        $0.normalColor = R.color.secondary_text()
        $0.normalImage = R.image.list.template()
        $0.selectedColor = R.color.primary_button()
        $0.title = R.string.localizable.list()
    }
    private lazy var aboutButton = ImageButton().then {
        $0.normalColor = R.color.secondary_text()
        $0.normalImage = R.image.info.template()
        $0.selectedColor = R.color.primary_button()
        $0.title = R.string.localizable.info()
    }
    private lazy var disposeBag = DisposeBag()
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        view.backgroundColor = R.color.background()
        setupConstraints()
        bindViewModel()
    }
    
    func setChild(controller: UIViewController) {
        children.forEach { $0.removeFromParent() }
        controller.willMove(toParent: self)
        containerView.addSubview(controller.view)
        controller.view.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
        controller.didMove(toParent: self)
    }
    
    private func setupConstraints() {
        view.addSubview(containerView)
        view.addSubview(bottomBarContainerView)
        bottomBarContainerView.addSubview(listButton)
        bottomBarContainerView.addSubview(aboutButton)
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        bottomBarContainerView.setContentHuggingPriority(.required, for: .vertical)
        bottomBarContainerView.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        listButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Spacings.normal)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(Spacings.normal)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-Spacings.small)
        }
        aboutButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Spacings.normal)
            $0.left.equalTo(listButton.snp.right).offset(Spacings.normal)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-Spacings.normal)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-Spacings.small)
            $0.size.equalTo(listButton.snp.size)
        }
    }
    
    private func bindViewModel() {
        let departmentListTrigger = listButton.tap
        let aboutTrigger = aboutButton.tap
        
        let output = viewModel.transform(input: .init(departmentListTrigger: departmentListTrigger,
                                                      aboutTrigger: aboutTrigger))
        output.departmentList
            .drive(onNext: { [weak self] _ in
                self?.listButton.isSelected = true
                self?.aboutButton.isSelected = false
            })
            .disposed(by: disposeBag)
        output.about
            .drive(onNext: { [weak self] _ in
                self?.listButton.isSelected = false
                self?.aboutButton.isSelected = true
            })
            .disposed(by: disposeBag)
    }
}
