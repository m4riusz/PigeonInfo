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
    
    func fetch(versionId: Int64) -> Observable<[District]> {
        return remote.fetch(versionId: versionId)
    }
    
    func get(versionId: Int64) -> Observable<[District]> {
        return local.get(versionId: versionId)
    }
}
