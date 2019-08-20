//
//  AccountVC.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 11/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    private var account: Account
    private var colour: UIColor
    private let networkDataHandler: NetworkDataHandler
    private let addAmount = 10.0
    
    init(networkDataHandler: NetworkDataHandler, account: Account, colour: UIColor) {
        self.networkDataHandler = networkDataHandler
        self.account = account
        self.colour = colour
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = AccountView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupView()
    }
    
    // MARK: IBOutlets
    unowned var accountView: AccountView { return self.view as! AccountView }
    unowned var accountNameLabel: UILabel { return accountView.accountNameLabel }
    unowned var accountValueLabel: UILabel { return accountView.accountValueLabel }
    unowned var accountMoneyboxLabel: UILabel { return accountView.accountMoneyboxLabel }
    unowned var addMoneyButton: UIButton { return accountView.addMoneyButton }
    
    private func setupNavBar() {
        title = account.name
    }

    private func setupView() {
        accountNameLabel.text = "\(account.name) Overview"
        let value = String(format: "Plan Value: £%.2f", account.value) 
        accountValueLabel.text = value
        let moneybox = String(format: "Moneybox: £%.2f", account.moneybox)
        accountMoneyboxLabel.text = moneybox
        
        addMoneyButton.addTarget(self, action: #selector(addMoneyButtonPressed), for: .touchUpInside)
        addMoneyButton.backgroundColor = colour
    }
    
    // MARK: IBActions
    @objc private func addMoneyButtonPressed() {
        networkDataHandler.oneOffPayment(amount: addAmount, productId: account.id) { (result) in
            
            switch result {
            case .success(let newMoneybox):
                let moneybox = String(format: "Moneybox: £%.2f", newMoneybox)
                
                DispatchQueue.main.async {
                    self.accountMoneyboxLabel.text = moneybox
                    self.createAlert(title: "Topup Successful", body: "You have successfully added £10 to your moneybox!")
                }
                break
            case .failure(let error):
                self.createAlert(title: "Payment Error", body: error)
            }
        }
    }
    
    //Create an event
    private func createAlert(title: String, body: String) {
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
