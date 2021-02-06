//
//  HomeVC.swift
//  CoreData_Demo
//
//  Created by Varsha Shivhare on 21/11/20.
//  Copyright © 2020 Varsha Shivhare. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    
    var name = User.currentUserData().name
    var email = User.currentUserData().email
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtName.text = name
        self.txtEmail.text = email
    }

    @IBAction func actionEdit(_ sender: Any) {
        userFetchRequest.predicate = NSPredicate(format: "email == %@ AND name == %@", email!, name!)
        do {
            let user = try context.fetch(userFetchRequest)
            
            let currentUser = user[0] as? User
            currentUser?.email = self.txtEmail.text
            currentUser?.name = self.txtName.text
            
            AppDelegate.shared().saveContext()
            Constant.shared.showToastMessage(message: "User updated successfully!")
            
        } catch {
            print(error)
        }
    }
    
    @IBAction func actionDelete(_ sender: Any) {
      
        userFetchRequest.predicate = NSPredicate(format: "email == %@ AND name == %@", email!, name!)
        do {
            let user = try context.fetch(userFetchRequest)
            
            let currentUser = (user[0] as? User)!
                    
            context.delete(currentUser)
            
            AppDelegate.shared().saveContext()
            Constant.shared.showToastMessage(message: "User deleted successfully!")
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            AppDelegate.shared().window?.rootViewController = vc
            
        } catch {
            print(error)
        }
    }
    
}
