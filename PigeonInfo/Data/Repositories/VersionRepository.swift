//
//  VersionRepository.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift

final class VersionRepository: VersionRepositoryProtocol {
    private let local: VersionDataSourceProtocol
    private let remote: VersionDataSourceProtocol
    
    init(local: VersionDataSourceProtocol,
         remote: VersionDataSourceProtocol) {
        self.local = local
        self.remote = remote
    }
    
    func fetchLatest() -> Observable<Version> {
        return remote.getLatest()
            .compactMap { $0 }
    }
    
    func getLatest() -> Observable<Version?> {
        return local.getLatest()
    }
}
