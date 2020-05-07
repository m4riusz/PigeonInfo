//
//  District.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 15/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation

struct District {
    let id: Int64
    let name: String
    let versionId: Int64
}

extension District: Hashable {
}

extension District: Equatable {
}
