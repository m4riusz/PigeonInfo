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
    case districts
    case departments(districtId: Int64)
}

extension PigeonInfo: TargetType {
    var baseURL: URL {
        return URL(string: AppDefaults.api)!
    }
    
    var path: String {
        switch self {
        case .districts:
            return "/v1/districts/"
        case .departments(let districtId):
            return "/v1/departments/\(districtId)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
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
