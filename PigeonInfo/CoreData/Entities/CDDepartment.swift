//
//  CDDepartment.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 15/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//
//

import Foundation
import CoreData

public class CDDepartment: NSManagedObject {
    @NSManaged public var id: Int64
    @NSManaged public var number: String
    @NSManaged public var name: String
}
