//
//  ViewController.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 10/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    public override func loadView() {
        self.view = LoginView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    
    }

    // MARK: IBOutlets
    unowned var loginView: LoginView { return self.view as! LoginView }
    unowned var emailTextField: UITextField { return loginView.emailTextField }
    unowned var passwordTextField: UITextField { return loginView.passwordTextField }
    unowned var loginButton: UIButton { return loginView.loginButton }

    // MARK: IBActions
    @objc private func loginButtonPressed() {
        print("Login!")
    }
    
}

