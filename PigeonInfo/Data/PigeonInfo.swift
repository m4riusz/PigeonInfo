//
//  PigeonInfo.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 07/05/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import Moya

enum PigeonInfo {
    case allVersions
    case latestVersion
    case districts(versionId: Int64)
    case departments(versionId: Int64, districtId: Int64)
}

extension PigeonInfo: TargetType {
    var baseURL: URL {
        return URL(string: AppDefaults.api)!
    }
    
    var path: String {
        switch self {
        case .allVersions:
            return "/versions"
        case .latestVersion:
            return "/versions/latest"
        case .districts(let versionId):
            return "/districts/\(versionId)"
        case .departments(let versionId, let districtId):
            return "/departments/\(versionId)/district/\(districtId)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .allVersions:
            return try! Data(contentsOf: Bundle.main.url(forResource: "v1_versions",
                                                         withExtension: "json")!)
        case .latestVersion:
            return try! Data(contentsOf: Bundle.main.url(forResource: "v1_versions_latest",
                                                         withExtension: "json")!)
        case .districts:
            return try! Data(contentsOf: Bundle.main.url(forResource: "v1_districts",
                                                         withExtension: "json")!)
        case .departments:
            return try! Data(contentsOf: Bundle.main.url(forResource: "v1_departments",
                                                         withExtension: "json")!)
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
