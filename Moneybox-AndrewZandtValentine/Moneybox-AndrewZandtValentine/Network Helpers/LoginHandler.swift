//
//  LoginHandler.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 12/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

struct LoginHandler {
    
    static func login(bearerToken: String, firstName: String) {
        let navController = UINavigationController()
        let homepage = HomepageVC(bearerToken: bearerToken, firstName: firstName)
        
        navController.viewControllers = [homepage]
        navController.navigationBar.barStyle = .black
        navController.navigationBar.tintColor = UIColor.AppColours.white
        navController.navigationBar.barTintColor = UIColor.AppColours.moneyboxBlue
        
        updateRootVC(rootVC: navController)
    }
    
    static func logout() {
        let vc = LoginVC()
        updateRootVC(rootVC: vc)
    }
    
    static private func updateRootVC(rootVC: UIViewController) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = rootVC
        appDelegate.window?.makeKeyAndVisible()
    }
}
