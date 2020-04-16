//
//  CoreDataRepresentable.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 16/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataRepresentable {
    associatedtype CoreDataType: DomainConvertibleType
    
    static var entityName: String { get }
    var id: Int64 {get}
    
    func update(entity: CoreDataType)
}
