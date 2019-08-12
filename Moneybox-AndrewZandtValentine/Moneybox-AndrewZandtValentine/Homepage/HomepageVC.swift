//
//  HomepageVC.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 11/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

class HomepageVC: UIViewController {
    
    let cellId = "cellId"
    var accounts : [Account] = [Account]()
    
    override func loadView() {
        super.loadView()
        
        self.view = HomepageView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAccounts()
        setupTableView()
    }
    
    // MARK: IBOutlets
    unowned var homepageView: HomepageView { return self.view as! HomepageView }
    unowned var tableView: UITableView { return homepageView.tableView }
    unowned var greetingLabel: UILabel { return homepageView.greetingLabel }
    unowned var totalPlanValueLabel: UILabel { return homepageView.totalPlanValueLabel }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(HomepageCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func getAccounts() {
        accounts.append(Account(name: "Stocks and Shares ISA", value: 1000, moneybox: 50, colour: UIColor.AppColours.purple))
        accounts.append(Account(name: "General Investment Account", value: 2000, moneybox: 20, colour: UIColor.AppColours.red))
        accounts.append(Account(name: "Lifetime ISA", value: 4000, moneybox: 100, colour: UIColor.AppColours.orange))
        
        greetingLabel.text = "Hello Andrew!"
        totalPlanValueLabel.text = "Total Plan Value: £7000.00"
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
        
        cell.account = currAccount
        
        return cell
    }
    
}
