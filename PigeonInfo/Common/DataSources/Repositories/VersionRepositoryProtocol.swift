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
    func refresh() -> Observable<Void>
    func getLatest() -> Observable<Version>
}
