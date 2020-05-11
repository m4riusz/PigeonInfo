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

    static func getByText(_ text: String?) -> NSFetchRequest<CDDepartment> {
        return NSFetchRequest<CDDepartment>(entityName: "CDDepartment").then {
            $0.sortDescriptors = [.init(key: "name", ascending: true)]
            guard let text = text, !text.isEmpty else {
                return
            }
            $0.predicate = .init(format: "number CONTAINS[cd] %@ OR name CONTAINS[cd] %@", text, text)
        }
    }
}

extension CDDepartment: DomainConvertibleType {
    func asDomain() -> Department {
        return .init(districtId: districtId,
                     id: id,
                     name: name,
                     number: number)
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
    }
}
