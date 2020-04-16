//
//  LocalDepartmentRepository.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 16/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

final class LocalDepartmentRepository: DepartmentRepositoryProtocol {
    func query(predicate: NSPredicate?, sorters: [NSSortDescriptor]) -> Observable<[Department]> {
        return .just([])
    }
    
    func create(object: Department) -> Observable<Void> {
        fatalError()
    }
}
