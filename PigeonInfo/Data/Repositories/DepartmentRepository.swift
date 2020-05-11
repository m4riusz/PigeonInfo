//
//  DepartmentRepository.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

final class DepartmentRepository: DepartmentRepositoryProtocol {
    private let local: DepartmentDataSourceProtocol
    private let remote: DepartmentDataSourceProtocol
    
    init(local: DepartmentDataSourceProtocol,
         remote: DepartmentDataSourceProtocol) {
        self.local = local
        self.remote = remote
    }
    
    func save(_ departments: [Department]) -> Observable<Void> {
        return local.save(departments)
    }
    
    func fetch(districtId: Int64) -> Observable<[Department]> {
        return remote.fetch(districtId: districtId)
    }
    
    func get(query: String?) -> Observable<[Department]> {
        return local.get(query: query)
    }
}
