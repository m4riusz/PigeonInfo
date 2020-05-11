//
//  DistrictRemoteDataSource.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift
import Moya

final class DistrictRemoteDataSource: DistrictDataSourceProtocol {
    private let moyaProvider: MoyaProvider<PigeonInfo>
    
    init(moyaProvider: MoyaProvider<PigeonInfo>) {
        self.moyaProvider = moyaProvider
    }
    
    func save(_ departments: [District]) -> Observable<Void> {
        fatalError()
    }
    
    func fetch(versionId: Int64) -> Observable<[District]> {
        return moyaProvider.rx.request(.districts(versionId: versionId))
            .map([District].self)
            .asObservable()
    }
    
    func get(versionId: Int64) -> Observable<[District]> {
        fatalError()
    }
}
