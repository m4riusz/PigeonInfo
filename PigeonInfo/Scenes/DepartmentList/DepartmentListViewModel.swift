//
//  DepartmentListViewModel.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 16/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

final class DepartmentListViewModel: ViewModelType {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    private let useCase: DepartmentListUseCaseProtocol
    var coordinator: DepartmentListCoordinatorProtocol!
    
    init(useCase: DepartmentListUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        return .init()
    }
}
