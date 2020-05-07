//
//  DistrictLocalDataSource.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift
import CoreData

final class DistrictLocalDataSource: DistrictDataSourceProtocol {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save(_ departments: [District]) -> Observable<Void> {
        fatalError()
    }
    
    func query(predicate: NSPredicate?,
               sorters: [NSSortDescriptor]?) -> Observable<[District]> {
        let fetchRequest = NSFetchRequest<CDDistrict>(entityName: District.entityName).then {
            $0.predicate = predicate
            $0.sortDescriptors = sorters
        }
        do {
            return .just(try context.fetch(fetchRequest)
                .compactMap { $0.asDomain() })
        } catch {
            return .error(error)
        }
    }
}
