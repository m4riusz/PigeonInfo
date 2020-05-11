//
//  CDDistrict.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 15/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//
//

import Foundation
import CoreData

public class CDDistrict: NSManagedObject {
    @NSManaged public var id: Int64
    @NSManaged public var name: String
    @NSManaged public var versionId: Int64
    
    static func getByVersionId(_ versionId: Int64) -> NSFetchRequest<CDDistrict> {
        return NSFetchRequest<CDDistrict>(entityName: "CDDistrict").then {
            $0.predicate = NSPredicate(format: "versionId == %d", versionId)
            $0.fetchLimit = 1
        }
    }
}

extension CDDistrict: DomainConvertibleType {
    func asDomain() -> District {
        return .init(id: id,
                     name: name,
                     versionId: versionId)
    }
}

extension District: CoreDataRepresentable {
    
    static var entityName: String {
        return "CDDistrict"
    }
    
    func update(entity: CDDistrict) {
        entity.id = id
        entity.name = name
        entity.versionId = versionId
    }
}
