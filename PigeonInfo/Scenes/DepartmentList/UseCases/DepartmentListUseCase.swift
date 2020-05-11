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
    
    func refresh() -> Observable<Void> {
        fatalError()
    }
    
    func departments(query: String?) -> Observable<[District: [Department]]> {
        return versionRepository.getLatest()
            .flatMapLatest { [unowned self] version in
                return Observable.combineLatest(
                    self.districtRepository.get(versionId: version?.id ?? -1),
                    
                    self.departmentRepository.query(predicate:
                        NSCompoundPredicate(andPredicateWithSubpredicates: [
                            CDDepartment.getByVersionId(version?.id ?? -1),
                            CDDepartment.getByText(query ?? "")
                        ]),
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
