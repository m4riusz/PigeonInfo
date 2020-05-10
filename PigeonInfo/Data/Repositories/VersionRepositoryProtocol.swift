//
//  VersionRepositoryProtocol.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

protocol VersionRepositoryProtocol {
    func save(_ version: Version) -> Observable<Void>
    func checkLatest() -> Observable<Version>
    func getLatest() -> Observable<Version?>
}
