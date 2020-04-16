//
//  DepartmentRepositoryProtocol.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 16/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

protocol DepartmentRepositoryProtocol {
    func query(predicate: NSPredicate?, sorters: [NSSortDescriptor]) -> Observable<[Department]>
    func create(object: Department) -> Observable<Void>
}
