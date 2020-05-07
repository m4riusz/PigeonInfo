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
        let query: Driver<String?>
        let tmpAction: Driver<Void>
    }
    
    struct Output {
        let items: Driver<[DepartmentSection]>
        let tmp: Driver<Void>
    }
    
    private let useCase: DepartmentListUseCaseProtocol
    var coordinator: DepartmentListCoordinatorProtocol!
    
    init(useCase: DepartmentListUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let departments = useCase.departments()
        let text = input.query.asObservable()
        let filteredItems = Observable.combineLatest(text, departments)
            .flatMapLatest { result -> Observable<[District: [Department]]> in
                let pairs = result.1
                guard let query = result.0, !query.isEmpty else {
                    return .just(pairs)
                }
                return .just(pairs
                    .compactMapValues { $0.searchText(query) }
                    .filter { !$0.value.isEmpty }
                )
        }
            .map { pairs -> [DepartmentSection] in
                return pairs.map { section in
                    .init(district: section.key,
                          departments: section.value.map { .init(department: $0) })
                }
        }
        .asDriverOnErrorJustComplete()
        let tmp = input.tmpAction
            .asObservable()
            .flatMapLatest { _ -> Observable<Void> in
                return self.useCase.mock()
        }
        .asDriverOnErrorJustComplete()
        
        return .init(items: filteredItems,
                     tmp: tmp)
    }
}
