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
    
    func fetch(versionId: Int64) -> Observable<[District]> {
        fatalError()
    }
    
    func get(versionId: Int64) -> Observable<[District]> {
        return context.rx.entities(fetchRequest: CDDistrict.getByVersionId(versionId))
            .map { items in items.map { $0.asDomain() } }
    }
}
