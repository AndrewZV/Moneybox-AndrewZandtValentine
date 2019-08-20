//
//  HomepageVC.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 11/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

class HomepageVC: UIViewController {
    
    private let cellId = "cellId"
    private var accounts: [Account] = [Account]()
    private var colours: [UIColor] = [UIColor.AppColours.purple, UIColor.AppColours.red, UIColor.AppColours.orange]
    private enum Text: String {
        case navBarTitle = "Accounts"
        case leftNavButtonTitle = "Logout"
    }
    
    private let firstName: String
    private let networkDataHandler: NetworkDataHandler
    
    init(bearerToken: String, firstName: String) {
        self.firstName = firstName
        self.networkDataHandler = NetworkDataHandler(bearerToken: bearerToken)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = HomepageView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getAccounts()
    }
    
    // MARK: IBOutlets
    unowned var homepageView: HomepageView { return self.view as! HomepageView }
    unowned var tableView: UITableView { return homepageView.tableView }
    unowned var greetingLabel: UILabel { return homepageView.greetingLabel }
    unowned var totalPlanValueLabel: UILabel { return homepageView.totalPlanValueLabel }
    
    private func setupNavBar() {
        title = Text.navBarTitle.rawValue
        let logout = UIBarButtonItem(title: Text.leftNavButtonTitle.rawValue, style: .plain, target: self, action: #selector(logoutButtonPressed))
        navigationItem.leftBarButtonItem = logout
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomepageCell.self, forCellReuseIdentifier: cellId)
        
        greetingLabel.text = "Hello \(self.firstName)!"
    }

    private func getAccounts() {
        tableView.isHidden = true
        totalPlanValueLabel.isHidden = true
        accounts.removeAll()
        
        networkDataHandler.getAccounts() { (accountsData, error) in
            
            guard let accountsDataVerified = accountsData else {
                //error
                return
            }
            
            var totalPlanValue = 0.0
            
            for account in accountsDataVerified {
                self.accounts.append(Account(name: account.name, id: account.id, value: account.value, moneybox: account.moneybox))
                totalPlanValue += account.value
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                let value = String(format: "Total Plan Value: £%.2f", totalPlanValue)
                self.totalPlanValueLabel.text = value
                self.tableView.isHidden = false
                self.totalPlanValueLabel.isHidden = false
            }
        } 
    }
    
    // MARK: IBActions
    @objc private func logoutButtonPressed() {
        LoginHandler.logout()
    }
    
}

extension HomepageVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomepageCell
        let currAccount = accounts[indexPath.row]
        
        cell.colour = colours[indexPath.row % colours.count]
        cell.account = currAccount
        
        return cell
    }
}

extension HomepageVC: UITableViewDelegate {
    
    //When the user selects an account, go to the account details page
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colour = colours[indexPath.row % colours.count]
        let account = accounts[indexPath.row]
        
        let vc = AccountVC(networkDataHandler: networkDataHandler, account: account, colour: colour)
        
        navigationController!.pushViewController(vc, animated: true)
    }
    
}
