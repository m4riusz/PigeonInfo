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
}

extension CDDistrict: DomainConvertibleType {
    func asDomain() -> District {
        return .init(id: id,
                     name: name)
    }
}

extension District: CoreDataRepresentable {
    
    static var entityName: String {
        return NSStringFromClass(CDDistrict.self)
    }
    
    func update(entity: CDDistrict) {
        entity.id = id
        entity.name = name
    }
}
