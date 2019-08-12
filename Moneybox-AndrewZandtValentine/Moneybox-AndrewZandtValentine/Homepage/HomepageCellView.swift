//
//  HomepageCellView.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 12/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit
import SnapKit

class HomepageCellView: UIView {
    
    let accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.avenirNextBold.rawValue, size: 20.0)
        label.textColor = UIColor.AppColours.white
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        return label
    }()
    
    let accountValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.avenirNextMedium.rawValue, size: 18.0)
        label.textColor = UIColor.AppColours.white
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        return label
    }()
    
    let accountMoneyboxLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.avenirNextMedium.rawValue, size: 18.0)
        label.textColor = UIColor.AppColours.white
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        return label
    }()
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [self.accountNameLabel, self.accountValueLabel, self.accountMoneyboxLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 5.0
        return stackView
    }()
    
    let backgroundButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 0
        button.set(cornerRadius: 20.0)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
        
        setSubviewForAutoLayout(backgroundButton)
        backgroundButton.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
        
        backgroundButton.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().inset(15)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
