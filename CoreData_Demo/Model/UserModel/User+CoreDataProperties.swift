//
//  User+CoreDataProperties.swift
//  CoreData_Demo
//
//  Created by Varsha Shivhare on 22/11/20.
//  Copyright © 2020 Varsha Shivhare. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}
