//
//  HomepageView.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 11/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit
import SnapKit

class HomepageView: UIView {
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.avenirNextRegular.rawValue, size: 30.0)
        label.textColor = UIColor.AppColours.darkGrey
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        return label
    }()
    
    let totalPlanValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.avenirNextRegular.rawValue, size: 20.0)
        label.textColor = UIColor.AppColours.darkGrey
        label.backgroundColor = UIColor.clear
        label.textAlignment = .right
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = 120
        tableView.showsVerticalScrollIndicator = false
        tableView.alwaysBounceVertical = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let offset = 5.0
        
        backgroundColor = UIColor.AppColours.white
        
        setSubviewsForAutoLayout([greetingLabel, totalPlanValueLabel, tableView])
        
        tableView.snp.makeConstraints { [unowned self] (make) in
            make.bottom.left.right.equalTo(self.layoutMarginsGuide)
            make.height.equalTo(self).multipliedBy(0.7)
        }
        
        greetingLabel.snp.makeConstraints { [unowned self] (make) in
            make.top.left.equalTo(self.layoutMarginsGuide).offset(offset)
            make.right.equalTo(self.layoutMarginsGuide).inset(offset)
            make.height.equalTo(self).multipliedBy(0.1)
        }
        
        totalPlanValueLabel.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(greetingLabel.snp.bottom)
            make.bottom.equalTo(tableView.snp.top)
            make.left.equalTo(self.layoutMarginsGuide).offset(offset)
            make.right.equalTo(self.layoutMarginsGuide).inset(offset)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
