//
//  DepartmentLocalDataSource.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift
import CoreData

final class DepartmentLocalDataSource: DepartmentDataSourceProtocol {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save(_ departments: [Department]) -> Observable<Void> {
        return .create { [unowned self] observer in
            do {
                let fetched = try self.context.fetch(CDDepartment.getByText(nil))
                fetched.forEach { self.context.delete( $0) }
                
                departments.forEach {
                    let object = CDDepartment(context: self.context)
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
    
    func fetch(districtId: Int64) -> Observable<[Department]> {
        fatalError()
    }
    
    func get(query: String?) -> Observable<[Department]> {
        return context.rx.entities(fetchRequest: CDDepartment.getByText(query))
            .map { $0.map { $0.asDomain() }}
    }
}
