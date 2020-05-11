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
import RxCoreData

final class DistrictLocalDataSource: DistrictDataSourceProtocol {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save(_ districts: [District]) -> Observable<Void> {
        return .create { [unowned self] observer in
            do {
                let fetched = try self.context.fetch(CDDistrict.getAll())
                fetched.forEach { self.context.delete( $0) }
                
                districts.forEach {
                    let object = CDDistrict(context: self.context)
                    $0.update(entity: object)
                }
                try self.context.save()
                observer.onNext(())
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
    
    func fetch() -> Observable<[District]> {
        fatalError()
    }
    
    func get() -> Observable<[District]> {
        return context.rx.entities(fetchRequest: CDDistrict.getAll())
            .map { $0.map { $0.asDomain() }}
    }
}
