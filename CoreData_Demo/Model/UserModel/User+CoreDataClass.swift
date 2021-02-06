//
//  User+CoreDataClass.swift
//  CoreData_Demo
//
//  Created by Varsha Shivhare on 22/11/20.
//  Copyright © 2020 Varsha Shivhare. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    
    static func isUserExist(email: String?, password: String?) -> Bool{
        if email != nil && password != nil {
            userFetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email!, password!)
        }
        
        let response = try! context.fetch(userFetchRequest) as! [User]
        
        return response.count > 0 ? true : false
        
    }
    
    static func currentUserData() -> User {
        var current_user = User()
        let res = try! context.fetch(userFetchRequest)
        if res.count > 0 {
            current_user = res[0] as! User
            return current_user
        }else{
            return current_user
        }
    }
    
    static func currentUserEmail() -> String {
        var current_email = ""
        let res = try! context.fetch(userFetchRequest)
        if res.count > 0 {
            current_email = (res[0] as! User).email ?? ""
            return current_email
        }else{
            return current_email
        }
    }
    
}
