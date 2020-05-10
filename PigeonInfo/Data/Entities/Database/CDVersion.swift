//
//  CDVersion.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import CoreData

public class CDVersion: NSManagedObject {
    @NSManaged public var id: Int64
    @NSManaged public var date: Date
}

extension CDVersion: DomainConvertibleType {
    func asDomain() -> Version {
        return .init(date: date,
                     id: id)
    }
}

extension Version: CoreDataRepresentable {
    static var entityName: String {
        return "CDVersion"
    }
    
    func update(entity: CDVersion) {
        entity.id = id
        entity.date = date
    }
}
