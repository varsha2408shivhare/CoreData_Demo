//
//  Constant.swift
//  CoreData_Demo
//
//  Created by Varsha Shivhare on 21/11/20.
//  Copyright © 2020 Varsha Shivhare. All rights reserved.
//

import Foundation
import CoreData

let context = AppDelegate.shared().persistentContainer.viewContext
var userFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")

class Constant {
    class var shared: Constant {
        struct Singleton {
            static let instance = Constant()
        }
        return Singleton.instance
    }
    
    func showToastMessage(message :String) {
        AppDelegate.shared().window?.makeToast(message, duration: 2.0, position: .bottom)
    }
}
