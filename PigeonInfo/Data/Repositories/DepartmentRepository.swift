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
    
    func fetch(versionId: Int64, districtId: Int64) -> Observable<[Department]> {
        fatalError()
    }
    
    func get(versionId: Int64, query: String?) -> Observable<[Department]> {
        ret
    }
}
