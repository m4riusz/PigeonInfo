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
    
    func save(_ version: Version) -> Observable<Void> {
        return local.save(version)
    }
    
    func refresh() -> Observable<Void> {
        return remote.getLatest()
            .mapToVoid()
    }
    
    func getLatest() -> Observable<Version?> {
        return local.getLatest()
    }
}
