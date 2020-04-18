//
//  Department.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 15/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation

struct Department {
    let id: Int64
    let districtId: Int64
    let name: String
    let number: String
}

extension Department: Hashable {
}

extension Department: Equatable {
}
