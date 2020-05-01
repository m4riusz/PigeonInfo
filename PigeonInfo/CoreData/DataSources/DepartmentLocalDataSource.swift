//
//  DepartmentLocalDataSource.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 17/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

final class DepartmentLocalDataSource: DepartmentDataSourceProtocol {
    
    func save(_ departments: [Department]) -> Observable<Void> {
        fatalError()
    }
    
    func query(predicate: NSPredicate?,
               sorters: [NSSortDescriptor]? = []) -> Observable<[Department]> {
        return .just([.init(id: 1, districtId: 1, name: "BIAŁA PODLASKA", number: "07"),
                      .init(id: 2, districtId: 1, name: "PARCZEW", number: "08"),
                      .init(id: 3, districtId: 1, name: "RADZYŃ PODLASKI", number: "09"),
                      .init(id: 4, districtId: 1, name: "MIĘDZYRZEC PODLASKI", number: "0391"),
                      .init(id: 5, districtId: 2, name: "ZIEMII SUWALSKO - AUGUSTOWSKIEJ", number: "011"),
                      .init(id: 6, districtId: 2, name: "BIAŁYSTOK", number: "012"),
                      .init(id: 7, districtId: 2, name: "EŁK", number: "013")])
    }
}
