//
//  NSManagedObjectContextExtension.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
    
    @discardableResult
    func updateOrCreate<T: NSManagedObject, D: CoreDataRepresentable>(type: T.Type, object: D)
        throws -> T where D.CoreDataType == T, T.DomainType == D {
            let fetchRequest = NSFetchRequest<T>(entityName: D.entityName)
            fetchRequest.predicate = NSPredicate(format: "id == %d", object.id)
            let result = try self.fetch(fetchRequest).first
            let final = result ?? T(context: self)
            object.update(entity: final)
            return final
    }
}
