//
//  SearchNavigationView.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class SearchNavigationView: BaseView {
    private lazy var navigationView = NavigationView()
    private lazy var searchContainerView = UIView()
    private lazy var textField = UITextField().then {
        $0.backgroundColor = R.color.background()
        $0.placeholder = R.string.localizable.search()
    }
    private lazy var cancelButton = Button().then {
        $0.setTitleColor(R.color.navigation_title(), for: .normal)
        $0.setTitle(R.string.localizable.cancel(), for: .normal)
    }
    private lazy var normalStateConstraints = getNormalStateConstraints()
    private lazy var searchStateConstraints = getSearchStateConstraints()
    private lazy var disposeBag = DisposeBag()
    private lazy var isInSearchMode = false
    
    var title: String? {
        willSet { navigationView.title = newValue }
    }
    var leftItems: [Button] = [] {
        willSet { navigationView.leftItems = newValue }
    }
    var righItems: [Button] = [] {
        willSet { navigationView.rightItems = newValue }
    }
    
    override func setup() {
        backgroundColor = R.color.navigation_background()
        addSubview(navigationView)
        addSubview(searchContainerView)
        searchContainerView.addSubview(textField)
        searchContainerView.addSubview(cancelButton)
        setNormalView(animate: false)
        setupBindings()
    }
    
    private func setupBindings() {
        textField.rx.controlEvent(.editingDidBegin)
            .subscribe { [weak self] _ in
                guard let weakSelf = self, !weakSelf.isInSearchMode  else {
                    return
                }
                weakSelf.isInSearchMode = true
                weakSelf.setSearchView()
        }
        .disposed(by: disposeBag)
        
        cancelButton.rx.tap
            .subscribe { [weak self] _ in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.isInSearchMode = false
                weakSelf.setNormalView()
        }
        .disposed(by: disposeBag)
    }
    
    private func setSearchView(animate: Bool = true) {
        textField.text = nil
        guard animate else {
            normalStateConstraints.forEach { $0.deactivate() }
            searchStateConstraints.forEach { $0.activate() }
            return
        }
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.normalStateConstraints.forEach { $0.deactivate() }
            self?.searchStateConstraints.forEach { $0.activate() }
            self?.superview?.layoutIfNeeded()
        }
    }
    
    private func setNormalView(animate: Bool = true) {
        textField.endEditing(true)
        textField.text = nil
        guard animate else {
            normalStateConstraints.forEach { $0.activate() }
            searchStateConstraints.forEach { $0.deactivate() }
            return
        }
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.normalStateConstraints.forEach { $0.activate() }
            self?.searchStateConstraints.forEach { $0.deactivate() }
            self?.superview?.layoutIfNeeded()
        }
    }
    
    
    private func getNormalStateConstraints() -> [Constraint] {
        let navigationViewConstraints = navigationView.snp.prepareConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Spacings.normal)
            $0.left.equalTo(safeAreaLayoutGuide.snp.left).offset(Spacings.normal)
            $0.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-Spacings.normal)
            $0.bottom.lessThanOrEqualToSuperview().offset(-Spacings.normal)
        }
        let searchContainerConstraints = searchContainerView.snp.prepareConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(Spacings.normal)
            $0.left.equalTo(safeAreaLayoutGuide.snp.left).offset(Spacings.normal)
            $0.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-Spacings.normal)
            $0.bottom.equalToSuperview().offset(-Spacings.normal)
        }
        let textFieldConstraints = textField.snp.prepareConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        let cancelButtonConstraints = cancelButton.snp.prepareConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(snp.right)
            $0.bottom.equalToSuperview()
        }
        return navigationViewConstraints +
            searchContainerConstraints +
            textFieldConstraints +
        cancelButtonConstraints
    }
    
    private func getSearchStateConstraints() -> [Constraint] {
        let navigationViewConstraints = navigationView.snp.prepareConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Spacings.normal)
            $0.left.equalTo(safeAreaLayoutGuide.snp.left).offset(Spacings.normal)
            $0.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-Spacings.normal)
            $0.bottom.lessThanOrEqualToSuperview().offset(-Spacings.normal)
        }
        let searchContainerConstraints = searchContainerView.snp.prepareConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Spacings.normal)
            $0.left.equalTo(safeAreaLayoutGuide.snp.left).offset(Spacings.normal)
            $0.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-Spacings.normal)
            $0.bottom.equalToSuperview().offset(-Spacings.normal)
        }
        let textFieldConstraints = textField.snp.prepareConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        let cancelButtonConstraints = cancelButton.snp.prepareConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(textField.snp.right).offset(Spacings.small)
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        return navigationViewConstraints +
            searchContainerConstraints +
            textFieldConstraints +
        cancelButtonConstraints
    }
}
