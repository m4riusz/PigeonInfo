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
        let refreshTrigger: Driver<Void>
        let query: Driver<String?>
    }
    
    struct Output {
        let refreshing: Driver<Bool>
        let items: Driver<[DepartmentSection]>
        let error: Driver<Error>
        let other: Driver<Void>
    }
    
    private let useCase: DepartmentListUseCaseProtocol
    var coordinator: DepartmentListCoordinatorProtocol!
    
    init(useCase: DepartmentListUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let refreshing = input.refreshTrigger
            .flatMapLatest { [unowned self] _ in
                return self.useCase.refresh()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
        }
      
        let items = input.query
            .flatMapLatest { [unowned self] query -> Driver<[DepartmentSection]> in
                return self.useCase.departments(query: query)
                    .map { pairs -> [DepartmentSection] in
                        return pairs.map { section in
                            .init(district: section.key,
                                  departments: section.value
                                    .map { .init(department: $0,
                                                 districtName: section.key.name) })
                        }
                }
                .asDriverOnErrorJustComplete()
        }
        
        return .init(refreshing: activityIndicator.asDriver(),
                     items: items.asDriver(),
                     error: errorTracker.asDriver(),
                     other: refreshing.asDriver())
    }
}
