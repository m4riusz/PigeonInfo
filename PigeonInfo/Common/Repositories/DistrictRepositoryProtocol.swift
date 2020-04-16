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
    func query(predicate: NSPredicate?, sorters: [NSSortDescriptor]) -> Observable<[District]>
    func create(object: District) -> Observable<Void>
}
