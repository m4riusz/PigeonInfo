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
    func save(_ departments: [Department]) -> Observable<Void>
    func fetch(districtId: Int64) -> Observable<[Department]>
    func get(query: String?) -> Observable<[Department]>
}
