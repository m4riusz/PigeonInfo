//
//  DepartmentLocalDataSource.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

final class DepartmentLocalDataSource: DepartmentDataSourceProtocol {
    
    func save(_ departments: [Department]) -> Observable<Void> {
        fatalError()
    }
    
    func query(predicate: NSPredicate?,
               sorters: [NSSortDescriptor]? = []) -> Observable<[Department]> {
        return .just([])
    }
}
