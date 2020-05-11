//
//  DistrictRepositoryProtocol.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 16/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

protocol DistrictRepositoryProtocol {
    func fetch(versionId: Int64) -> Observable<[District]>
    func get(versionId: Int64) -> Observable<[District]>
}
