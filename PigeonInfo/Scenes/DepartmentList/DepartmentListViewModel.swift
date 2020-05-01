//
//  DepartmentListViewModel.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 16/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

final class DepartmentListViewModel: ViewModelType {
    
    struct Input {
        let loadTrigger: Driver<Void>
        let query: Driver<String>
    }
    
    struct Output {
        let items: Driver<[DepartmentSection]>
    }
    
    private let useCase: DepartmentListUseCaseProtocol
    var coordinator: DepartmentListCoordinatorProtocol!
    
    init(useCase: DepartmentListUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let items = useCase.departments(query: nil)
            .map { pairs -> [DepartmentSection] in
                return pairs.map { section in
                    .init(district: section.key,
                          departments: section.value.map { .init(department: $0) })
                }
        }
        .asDriverOnErrorJustComplete()
        return .init(items: items)
    }
}
