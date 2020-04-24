//
//  DepartmentSection.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 24/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxDataSources

struct DepartmentSection {
    let id: Int64
    let name: String
    var items: [DepartmentViewModel]
    
    init(district: District, departments: [DepartmentViewModel]) {
        self.id = district.id
        self.name = district.name
        self.items = departments
    }
}

extension DepartmentSection: Hashable {
}

extension DepartmentSection: Equatable {
}

extension DepartmentSection: AnimatableSectionModelType {
    var identity: Int64 { id }
    
    init(original: DepartmentSection, items: [DepartmentViewModel]) {
        self = original
        self.items = items
    }
}
