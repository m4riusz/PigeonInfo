//
//  VersionRemoteDataSource.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 01/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RxMoya
import Then

extension JSONDecoder: Then {

}

final class VersionRemoteDataSource: VersionDataSourceProtocol {
    private let moyaProvider: MoyaProvider<PigeonInfo>
    
    init(moyaProvider: MoyaProvider<PigeonInfo>) {
        self.moyaProvider = moyaProvider
    }
    
    func save(_ version: Version) -> Observable<Void> {
        fatalError()
    }
    
    func getLatest() -> Observable<Version?> {
        return moyaProvider.rx.request(.latestVersion)
        .mapString()
            .map { text -> Version? in
                let decoder = JSONDecoder().then {
                    $0.dateDecodingStrategy = .iso8601
                }
                return try? decoder.decode(Version.self, from: text.data(using: .utf8)!)
        }
            .asObservable()
    }
}
