//
//  DepartmentRemoteDataSource.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift
import Moya

final class DepartmentRemoteDataSource: DepartmentDataSourceProtocol {
    private let moyaProvider: MoyaProvider<PigeonInfo>
    
    init(moyaProvider: MoyaProvider<PigeonInfo>) {
        self.moyaProvider = moyaProvider
    }
    
    func save(_ departments: [Department]) -> Observable<Void> {
        fatalError()
    }
    
    func query(predicate: NSPredicate?,
               sorters: [NSSortDescriptor]?) -> Observable<[Department]> {
        fatalError()
    }
}
