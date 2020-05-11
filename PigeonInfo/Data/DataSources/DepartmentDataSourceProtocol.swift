//
//  DepartmentDataSourceProtocol.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

protocol DepartmentDataSourceProtocol {
    func save(_ departments: [Department]) -> Observable<Void>
    func fetch(versionId: Int64, districtId: Int64) -> Observable<[Department]>
    func get(versionId: Int64) -> Observable<[Department]>
}
