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
    func save(_ departments: [District]) -> Observable<Void>
    func query(predicate: NSPredicate?,
               sorters: [NSSortDescriptor]?) -> Observable<[District]>
}
