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
    }
    private lazy var listButton = ImageButton().then {
        $0.normalColor = .systemGray
        $0.normalImage = UIImage()
        $0.selectedColor = .systemBlue
        $0.selectedImage = UIImage()
        $0.title = "List"
    }
    private lazy var aboutButton = ImageButton().then {
        $0.normalColor = .systemGray
        $0.normalImage = UIImage()
        $0.selectedColor = .systemBlue
        $0.selectedImage = UIImage()
        $0.title = "About"
    }
    private lazy var disposeBag = DisposeBag()
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        setupLayout()
        bindViewModel()
    }
    
    func setChild(controller: UIViewController) {
        self.children.forEach { $0.removeFromParent() }
        controller.willMove(toParent: self)
        self.containerView.addSubview(controller.view)
        controller.view.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
        controller.didMove(toParent: self)
    }
    
    private func setupLayout() {
        view.addSubview(containerView)
        view.addSubview(bottomBarContainerView)
        bottomBarContainerView.addSubview(listButton)
        bottomBarContainerView.addSubview(aboutButton)
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        bottomBarContainerView.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        listButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Spacings.normal)
            $0.left.equalToSuperview().offset(Spacings.normal)
            $0.bottom.equalToSuperview().offset(-Spacings.normal)
        }
        aboutButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Spacings.normal)
            $0.left.equalTo(listButton.snp.right).offset(Spacings.normal)
            $0.right.equalToSuperview().offset(-Spacings.normal)
            $0.bottom.equalToSuperview().offset(-Spacings.normal)
            $0.size.equalTo(listButton.snp.size)
        }
    }
    
    private func bindViewModel() {
        let departmentListTrigger = listButton.tap
        let aboutTrigger = aboutButton.tap
        
        let output = viewModel.transform(input: .init(departmentListTrigger: departmentListTrigger,
                                                      aboutTrigger: aboutTrigger))
        output.departmentList
            .drive()
            .disposed(by: disposeBag)
        output.about
            .drive()
            .disposed(by: disposeBag)
    }
}
