//
//  ObservableExtension.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 26/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension SharedSequenceConvertibleType {
    
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        map { _ in }
    }
}

extension ObservableType {
    
    func catchErrorJustComplete() -> Observable<Element> {
        catchError { _ in .empty() }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        asDriver { _ in .empty() }
    }
    
    func mapToVoid() -> Observable<Void> {
        map { _ in }
    }
}
