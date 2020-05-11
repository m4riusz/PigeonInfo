//
//  DistrictReporitory.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

final class DistrictRepository: DistrictRepositoryProtocol {
    private let local: DistrictDataSourceProtocol
    private let remote: DistrictDataSourceProtocol
    
    init(local: DistrictDataSourceProtocol,
         remote: DistrictDataSourceProtocol) {
        self.local = local
        self.remote = remote
    }
    
    func save(_ districts: [District]) -> Observable<Void> {
        return local.save(districts)
    }
    
    func fetch() -> Observable<[District]> {
        return remote.fetch()
    }
    
    func get() -> Observable<[District]> {
        return local.get()
    }
}
