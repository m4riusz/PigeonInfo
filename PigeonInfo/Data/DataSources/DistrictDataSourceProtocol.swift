//
//  DistrictDataSourceProtocol.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

protocol DistrictDataSourceProtocol {
    func save(_ districts: [District]) -> Observable<Void>
    func fetch() -> Observable<[District]>
    func get() -> Observable<[District]>
}
