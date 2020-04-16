//
//  DepartmentListUseCase.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 16/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

final class DepartmentListUseCase: DepartmentListUseCaseProtocol {
    
    private let districtRepository: DistrictRepositoryProtocol
    private let departmentRepository: DepartmentRepositoryProtocol
    
    init(districtRepository: DistrictRepositoryProtocol,
         departmentRepository: DepartmentRepositoryProtocol) {
        self.districtRepository = districtRepository
        self.departmentRepository = departmentRepository
    }
    
    func departments() -> Observable<[District: [Department]]> {
        return Observable.combineLatest(districtRepository.query(predicate: nil, sorters: []),
                                        departmentRepository.query(predicate: nil, sorters: []))
            .flatMapLatest { districts, departments -> Observable<[District: [Department]]>  in
                return .just(districts
                    .reduce(into: [District: [Department]]()) { result, disctrict in
                        result[disctrict] = departments.filter { $0.districtId == disctrict.id }
                })
        }
    }
}
