//
//  ViewController.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 10/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func loadView() {
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
    unowned var logoLabel: UILabel { return loginView.logoLabel }

    // MARK: IBActions
    @objc private func loginButtonPressed() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        guard loginDetailValidated(input: email) else {
            createAlert(title: "Invalid Email Address", body: "Please check your email address is correct and try again.")
            return
        }
        guard loginDetailValidated(input: password) else {
            createAlert(title: "Invalid Password", body: "Please check your password is correct and try again.")
            return
        }
        
        let nVH = NetworkVerificationHandler(email: email, password: password)
        nVH.login() { (result) in

            switch result {
            case .success(let (bearerToken,firstName)):
                DispatchQueue.main.async {
                    LoginHandler.login(bearerToken: bearerToken, firstName: firstName)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    if error == .serverError {
                        self.createAlert(title: "Server Error", body: "There was an error with the server. Please try again.")
                    } else if error == .invalidDetails {
                        self.createAlert(title: "Invalid Login Error", body: "Please insure your login details are correct and try again.")
                    }
                }
            }
        }
    }
    
    // MARK: Class Methods
    func loginDetailValidated(input: String) -> Bool {
        if input == "" { return false }
        return true
    }
    
    //Create an event
    private func createAlert(title: String, body: String) {
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

