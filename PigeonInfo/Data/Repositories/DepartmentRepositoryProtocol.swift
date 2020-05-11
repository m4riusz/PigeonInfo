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
    func fetch(versionId: Int64, districtId: Int64) -> Observable<[Department]>
    func get(versionId: Int64, query: String?) -> Observable<[Department]>
}
