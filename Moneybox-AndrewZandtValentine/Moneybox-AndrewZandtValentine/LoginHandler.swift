//
//  LoginHandler.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 12/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

class LoginHandler {
    
    private enum Text: String {
        case sandboxURL = "https://api-test01.moneyboxapp.com/users/login"
    }
    
    private struct LoginDetails: Codable {
        let email: String
        let password: String
        let idfa: String
    }
    
    func loginAttempt(email: String, password: String) -> Bool {
        
        
        
        return true
    }
    
    static func updateRootVC() {
        let status = UserDefaults.standard.bool(forKey: UserDefaultKeys.loginState.rawValue)
        let rootVC: UIViewController?
        
        if (status) {
            let navController = UINavigationController()
            let homepage = HomepageVC()
            
            navController.viewControllers = [homepage]
            navController.navigationBar.barStyle = .black
            navController.navigationBar.tintColor = UIColor.AppColours.white
            navController.navigationBar.barTintColor = UIColor.AppColours.moneyboxBlue
            
            rootVC = navController
        } else {
            rootVC = LoginVC()
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = rootVC
        appDelegate.window?.makeKeyAndVisible()
    }
    
}
