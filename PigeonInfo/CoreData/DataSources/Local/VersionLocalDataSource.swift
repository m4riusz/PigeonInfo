//
//  VersionLocalDataSource.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import CoreData
import RxSwift
import RxCoreData

final class VersionLocalDataSource: VersionDataSourceProtocol {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save(_ version: Version) -> Observable<Void> {
        return .create { [weak self] observer in
            do {
                try self?.context.updateOrCreate(type: CDVersion.self,
                                                 object: version)
                observer.onNext(())
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
    
    func getLatest() -> Observable<Version?> {
        let fetchRequest = NSFetchRequest<CDVersion>(entityName: Version.entityName).then {
            $0.fetchLimit = 1
            $0.sortDescriptors = [NSSortDescriptor(key: "id", ascending: false)]
        }
        return context.rx.entities(fetchRequest: fetchRequest)
            .map { $0.first?.asDomain() }
    }
}
