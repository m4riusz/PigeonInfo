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
    @NSManaged public var temporary: Bool
    
    static func getLatest() -> NSFetchRequest<CDVersion> {
        return NSFetchRequest<CDVersion>(entityName: "CDVersion").then {
            $0.predicate = .init(format: "temporary == %@", NSNumber(value: true))
            $0.sortDescriptors = [.init(key: "date", ascending: true)]
            $0.fetchLimit = 1
        }
    }
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
        entity.temporary = temporary
    }
}
