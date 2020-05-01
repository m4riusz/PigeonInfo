//
//  CDVersion.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import CoreData

class CDVersion: NSManagedObject {
    @NSManaged var id: Int64
    @NSManaged var date: Date
    @NSManaged var districts: NSSet
}

extension CDVersion {
    static func getDistricts(versionId: Int64) -> NSFetchRequest<CDDistrict> {
        let request = CDDistrict.fetchRequest() as! NSFetchRequest<CDDistrict>
        request.predicate = NSPredicate(format: "id == %@", versionId)
        return request
    }
}

extension CDVersion: DomainConvertibleType {
    func asDomain() -> Version {
        return .init(id: id,
                     districts: <#T##[District]#>))
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
