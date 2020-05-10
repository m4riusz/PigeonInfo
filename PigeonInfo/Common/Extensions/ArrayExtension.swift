//
//  ArrayExtension.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 07/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation

extension Array where Element == Department {
    func searchText(_ text: String) -> [Department] {
        let lowercasedText = text.lowercased()
        return self.filter {
            $0.name.lowercased().contains(lowercasedText) ||
                $0.number.lowercased().contains(lowercasedText)
        }
    }
}
