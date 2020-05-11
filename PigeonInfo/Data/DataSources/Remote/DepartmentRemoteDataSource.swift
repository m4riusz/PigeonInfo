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
import RxMoya

final class DepartmentRemoteDataSource: DepartmentDataSourceProtocol {
    private let moyaProvider: MoyaProvider<PigeonInfo>
    
    init(moyaProvider: MoyaProvider<PigeonInfo>) {
        self.moyaProvider = moyaProvider
    }
    
    func save(_ departments: [Department]) -> Observable<Void> {
        fatalError()
    }
    
    func fetch(districtId: Int64) -> Observable<[Department]> {
        return moyaProvider.rx.request(.departments(districtId: districtId))
            .map([Department].self)
            .asObservable()
    }
    
    func get(query: String?) -> Observable<[Department]> {
        fatalError()
    }
}
