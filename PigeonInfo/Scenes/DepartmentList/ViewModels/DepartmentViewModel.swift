//
//  DepartmentViewModel.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 24/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxDataSources
import UIKit

struct DepartmentViewModel {
    let id: Int64
    let districtId: Int64
    let name: String
    let number: String
    let color: UIColor
    
    init(department: Department, districtName: String) {
        self.id = department.id
        self.districtId = department.districtId
        self.name = department.name
        self.number = department.number
        self.color = .generateColorFor(text: districtName)
    }
}

extension DepartmentViewModel: Hashable {
}

extension DepartmentViewModel: Equatable {
}

extension DepartmentViewModel: IdentifiableType {
    var identity: Int64 { id }
}
