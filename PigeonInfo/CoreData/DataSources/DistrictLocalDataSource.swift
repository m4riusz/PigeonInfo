//
//  DistrictLocalDataSource.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

final class DistrictLocalDataSource: DistrictDataSourceProtocol {
    
    func save(_ departments: [District]) -> Observable<Void> {
        fatalError()
    }
    
    func query(predicate: NSPredicate?,
               sorters: [NSSortDescriptor]?) -> Observable<[District]> {
        return .just([.init(id: 1, name: "BIAŁA PODLASKA"),
                      .init(id: 2, name: "BIAŁYSTOK")])
    }
}
