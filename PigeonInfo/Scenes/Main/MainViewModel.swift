//
//  MainViewModel.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class MainViewModel: ViewModelType {
    struct Input {
        let departmentListTrigger: Driver<Void>
        let aboutTrigger: Driver<Void>
    }
    struct Output {
        let departmentList: Driver<Void>
        let about: Driver<Void>
    }
    var coordinator: MainCoordinatorProtocol!
    
    func transform(input: Input) -> Output {
        let departmentList = input.departmentListTrigger
            .do(onNext: coordinator.goToDepartmentList)
        let about = input.aboutTrigger
            .do(onNext: coordinator.goToAbout)
        return .init(departmentList: departmentList,
                     about: about)
    }
}
