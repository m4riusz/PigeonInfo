//
//  Version.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation

struct Version {
    let id: Int64
    let districts: [District]
}

extension Version: Hashable {
}

extension Version: Equatable {
}
