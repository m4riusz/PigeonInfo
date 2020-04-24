//
//  ReusableElement.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 24/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

protocol ReusableElement: class {
    static func reusableIdentifier() -> String
}

extension ReusableElement {
    static func reusableIdentifier() -> String {
        return NSStringFromClass(Self.self)
    }
}

protocol ReusableRegister {
    func registerHeader<T: ReusableElement>(_ header: T.Type)
    func registerCell<T: ReusableElement>(_ cell: T.Type)
    func dequeueHeader<T: ReusableElement>(_ header: T.Type,
                                           indexPath: IndexPath) -> T
    func dequeueCell<T: ReusableElement>(_ cell: T.Type,
                                         indexPath: IndexPath) -> T
}

extension UICollectionReusableView: ReusableElement {
}

extension UICollectionView: ReusableRegister {
    
    func registerHeader<T>(_ header: T.Type) where T : ReusableElement {
        register(T.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: T.reusableIdentifier())
    }
    
    func registerCell<T>(_ cell: T.Type) where T : ReusableElement {
        register(T.self, forCellWithReuseIdentifier: T.reusableIdentifier())
    }
    
    func dequeueHeader<T>(_ header: T.Type,
                          indexPath: IndexPath) -> T where T : ReusableElement {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                withReuseIdentifier: T.reusableIdentifier(),
                                                for: indexPath) as! T
    }
  
    func dequeueCell<T>(_ cell: T.Type,
                        indexPath: IndexPath) -> T where T : ReusableElement {
        return dequeueReusableCell(withReuseIdentifier: T.reusableIdentifier(),
                                       for: indexPath) as! T
    }
}
