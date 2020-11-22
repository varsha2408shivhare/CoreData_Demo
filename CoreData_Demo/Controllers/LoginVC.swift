//
//  LoginVC.swift
//  CoreData_Demo
//
//  Created by Varsha Shivhare on 21/11/20.
//  Copyright © 2020 Varsha Shivhare. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var vwLogin: UIView!
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var btnSignUp: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vwLogin.layer.cornerRadius = 10.0
        self.btnLogin.layer.cornerRadius = 8.0
        self.btnSignUp.layer.cornerRadius = 8.0
    }

    @IBAction func loginAction(_ sender: Any) {
        //if userexist go to home
        if txtEmail.text != nil && txtPassword.text != nil {
            if User.isUserExist(email: txtEmail.text, password: txtPassword.text) {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                AppDelegate.shared().window?.rootViewController = vc
            }else{
                AppDelegate.shared().window?.makeToast("User does not exist, please signup!")
            }
        }
        
    }
    @IBAction func signUpAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
