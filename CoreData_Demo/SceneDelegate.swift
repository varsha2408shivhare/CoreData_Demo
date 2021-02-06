//
//  SceneDelegate.swift
//  CoreData_Demo
//
//  Created by Varsha Shivhare on 21/11/20.
//  Copyright © 2020 Varsha Shivhare. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

     var window: UIWindow?
       
       class func shared() -> (SceneDelegate)
       {
           let scene = UIApplication.shared.connectedScenes.first
           let sd : SceneDelegate = ((scene?.delegate as? SceneDelegate)!)
           return sd
       }


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        AppDelegate.shared().window = window
        window!.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if scene is UIWindowScene {
            if User.currentUserEmail() != ""{
                let tabBarStoryboard = UIStoryboard(name:"Main", bundle: nil)
                let vc = tabBarStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                let navVC = UINavigationController(rootViewController: vc)
                self.window?.rootViewController = navVC
                
            }else{
                let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                let navVC = UINavigationController(rootViewController: ViewController)
                self.window?.rootViewController = navVC
                
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

