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
    private let versionRepository: VersionRepositoryProtocol
    
    init(districtRepository: DistrictRepositoryProtocol,
         departmentRepository: DepartmentRepositoryProtocol,
         versionRepository: VersionRepositoryProtocol) {
        self.districtRepository = districtRepository
        self.departmentRepository = departmentRepository
        self.versionRepository = versionRepository
    }
    
    func mock() -> Observable<Void> {
        return versionRepository.save(.init(date: Date(), id: 1))
            .do(onNext: { _ in
                CoreDataStack().saveContext()
            })
    }
    
    func departments() -> Observable<[District: [Department]]> {
        return versionRepository.getLatest()
            .flatMapLatest { [unowned self] version in
                return Observable.combineLatest(
                    self.districtRepository.query(predicate: CDDistrict.getByVersionId(version?.id ?? -1),
                                                  sorters: nil),
                    self.departmentRepository.query(predicate: CDDepartment.getByVersionId(version?.id ?? -1),
                                                    sorters: nil))
        }.flatMapLatest { result -> Observable<[District: [Department]]> in
            let districts = result.0
            let departments = result.1
            return .just(districts
                .reduce(into: [District: [Department]]()) { result, disctrict in
                    result[disctrict] = departments.filter { $0.districtId == disctrict.id }
            })
        }
    }
}
