//
//  UICollectionViewExtension.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit

extension UICollectionReusableView: ReusableElement {
}

extension UICollectionView: ReusableRegister {
    
    convenience init(_ collectionViewLayout: UICollectionViewLayout) {
        self.init(frame: .zero,
                  collectionViewLayout: collectionViewLayout)
    }
    
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
