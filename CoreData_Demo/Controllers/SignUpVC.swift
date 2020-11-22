//
//  SignUpVC.swift
//  CoreData_Demo
//
//  Created by Varsha Shivhare on 21/11/20.
//  Copyright © 2020 Varsha Shivhare. All rights reserved.
//

import UIKit
import CoreData

class SignUpVC: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var vwSignUp: UIView!
    @IBOutlet var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vwSignUp.layer.cornerRadius = 10.0
        self.btnSignUp.layer.cornerRadius = 8.0
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        if txtName.text != "" && txtEmail.text != "" && txtPassword.text != "" {
            
            //create user object & save data
            let user = User(context: context)
            user.setValue(txtName.text, forKey: "name")
            user.setValue(txtEmail.text, forKey: "email")
            user.setValue(txtPassword.text, forKey: "password")
            AppDelegate.shared().saveContext()
            //show success toast
            AppDelegate.shared().window?.makeToast("Data saved successfully!")
            //naviate to home
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            AppDelegate.shared().window?.rootViewController = vc
            
        }else{
            print("Enter valid details")
            AppDelegate.shared().window?.makeToast("Enter valid details!")
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
