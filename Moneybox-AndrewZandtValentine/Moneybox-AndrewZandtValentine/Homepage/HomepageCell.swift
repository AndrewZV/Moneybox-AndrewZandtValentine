//
//  HomepageCell.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 12/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

class HomepageCell: UITableViewCell {
    
    var colour: UIColor?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundView = HomepageCellView()
        selectionStyle = .none
    }
    
    var account: Account? {
        didSet {
            backView.backgroundColor = colour //CHANGE
            accountNameLabel.text = account?.name
            let value = String(format: "Plan Value: £%.2f", account!.value) //ADD GUARD STATEMENTS HERE **********
            accountValueLabel.text = value
            let moneybox = String(format: "Moneybox: £%.2f", account!.moneybox)
            accountMoneyboxLabel.text = moneybox
        }
    }
    
    // MARK: IBOutlets
    unowned var homepageCellView: HomepageCellView { return self.backgroundView as! HomepageCellView }
    unowned var backView: UIView { return homepageCellView.backView }
    unowned var accountNameLabel: UILabel { return homepageCellView.accountNameLabel }
    unowned var accountValueLabel: UILabel { return homepageCellView.accountValueLabel }
    unowned var accountMoneyboxLabel: UILabel { return homepageCellView.accountMoneyboxLabel }
    
    // MARK: IBActions
    @objc private func accountButtonPressed() {
        print("Press!")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
