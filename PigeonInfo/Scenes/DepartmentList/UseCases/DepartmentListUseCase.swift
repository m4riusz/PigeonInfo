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
    
    func refresh() -> Observable<Void> {
        return self.sync()
    }
    
    func departments(query: String?) -> Observable<[District: [Department]]> {
        return Observable.combineLatest(
            self.districtRepository.get(),
            self.departmentRepository.get(query: query))
            .flatMapLatest { result -> Observable<[District: [Department]]> in
                let districts = result.0
                let departments = result.1
                return .just(districts
                    .reduce(into: [District: [Department]]()) { result, disctrict in
                        result[disctrict] = departments.filter { $0.districtId == disctrict.id } }
                    .filter { !$0.value.isEmpty }
                )
        }
    }
    
    private func sync() -> Observable<Void> {
        let districts = districtRepository.fetch().share()
        
        let districtsSave =  districts.flatMapLatest { [unowned self] items in
            return self.districtRepository.save(items)
        }
        
        let departmentsSave = districts.map { [unowned self] items in
            return items.map { self.departmentRepository.fetch(districtId: $0.id) }
        }
        .flatMap(Observable.combineLatest)
        .flatMapLatest { items -> Observable<[Department]> in
            return .just(items.reduce([Department](), { $0 + $1 }))
        }
        .flatMapLatest { self.departmentRepository.save($0) }

        return Observable.merge(districtsSave, departmentsSave)
    }
    
    
}
