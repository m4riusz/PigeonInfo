//
//  CDDepartment.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 15/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//
//

import Foundation
import CoreData

public class CDDepartment: NSManagedObject {
    @NSManaged public var id: Int64
    @NSManaged public var districtId: Int64
    @NSManaged public var number: String
    @NSManaged public var name: String
}

extension CDDepartment: DomainConvertibleType {
    func asDomain() -> Department {
        return .init(id: id,
                     districtId: districtId,
                     name: name,
                     number: number)
    }
}

extension Department: CoreDataRepresentable {
    static var entityName: String {
        return NSStringFromClass(CDDepartment.self)
    }
    
    func update(entity: CDDepartment) {
        entity.id = id
        entity.districtId = districtId
        entity.name = name
        entity.number = number
    }
}
