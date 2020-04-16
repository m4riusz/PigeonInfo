//
//  DomainConvertibleType.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 16/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation

protocol DomainConvertibleType {
    associatedtype DomainType
    
    func asDomain() -> DomainType
}
