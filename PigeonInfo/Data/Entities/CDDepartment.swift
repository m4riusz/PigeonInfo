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
    @NSManaged public var districtId: Int64
    @NSManaged public var id: Int64
    @NSManaged public var number: String
    @NSManaged public var name: String
    @NSManaged public var versionId: Int64
    
    static func getByVersionId(_ versionId: Int64) -> NSPredicate {
        return .init(format: "versionId == %d", versionId)
    }
}

extension CDDepartment: DomainConvertibleType {
    func asDomain() -> Department {
        return .init(districtId: districtId,
                     id: id,
                     name: name,
                     number: number,
                     versionId: versionId)
    }
}

extension Department: CoreDataRepresentable {
    static var entityName: String {
        return "CDDepartment"
    }
    
    func update(entity: CDDepartment) {
        entity.districtId = districtId
        entity.id = id
        entity.name = name
        entity.number = number
        entity.versionId = versionId
    }
}
