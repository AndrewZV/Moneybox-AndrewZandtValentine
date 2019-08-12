//
//  AccountVC.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 11/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    var account: Account?
    var colour: UIColor?
    
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
        title = account?.name
    }

    private func setupView() {
        accountNameLabel.text = "\(account!.name) Overview"
        let value = String(format: "Plan Value: £%.2f", account!.value) //ADD GUARD STATEMENTS HERE **********
        accountValueLabel.text = value
        let moneybox = String(format: "Moneybox: £%.2f", account!.moneybox)
        accountMoneyboxLabel.text = moneybox
        
        addMoneyButton.backgroundColor = colour
    }
}
