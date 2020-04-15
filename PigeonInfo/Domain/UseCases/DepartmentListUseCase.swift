//
//  DepartmentListUseCase.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 15/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

protocol DepartmentListUseCase {
    func districts() -> Observable<[District: [Department]]>
}
