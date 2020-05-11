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
import RxMoya

final class DistrictRemoteDataSource: DistrictDataSourceProtocol {
    private let moyaProvider: MoyaProvider<PigeonInfo>
    
    init(moyaProvider: MoyaProvider<PigeonInfo>) {
        self.moyaProvider = moyaProvider
    }
    
    func save(_ districts: [District]) -> Observable<Void> {
        fatalError()
    }
    
    func fetch() -> Observable<[District]> {
        return moyaProvider.rx.request(.districts)
            .map([District].self)
            .asObservable()
    }
    
    func get() -> Observable<[District]> {
        fatalError()
    }
}
