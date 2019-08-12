//
//  AccountView.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 11/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit
import SnapKit

class AccountView: UIView {

    enum Text: String {
        case button = "Add £10"
    }
    
    let accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.avenirNextBold.rawValue, size: 20.0)
        label.textColor = UIColor.AppColours.darkGrey
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        return label
    }()
    
    let accountValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.avenirNextMedium.rawValue, size: 22.0)
        label.textColor = UIColor.AppColours.darkGrey
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        return label
    }()
    
    let accountMoneyboxLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.avenirNextMedium.rawValue, size: 22.0)
        label.textColor = UIColor.AppColours.darkGrey
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [self.accountNameLabel, self.accountValueLabel, self.accountMoneyboxLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 0
        return stackView
    }()
    
    let addMoneyButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: AppFonts.avenirNextMedium.rawValue, size: 30.0)
        button.setTitle(Text.button.rawValue, for: .normal)
        button.setTitleColor(UIColor.AppColours.white, for: .normal)
        button.layer.borderColor = UIColor.AppColours.white.cgColor
        button.layer.borderWidth = 1.0
        button.set(cornerRadius: 20.0)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.AppColours.white
        
        setSubviewsForAutoLayout([stackView, addMoneyButton])
        
        let offset = 10
        
        stackView.snp.makeConstraints { [unowned self] (make) in
            make.left.top.equalTo(self.layoutMarginsGuide).offset(offset)
            make.right.equalTo(self.layoutMarginsGuide).inset(offset)
            make.height.equalTo(150)
        }
        
        addMoneyButton.snp.makeConstraints { [unowned self] (make) in
            make.bottom.equalTo(self.layoutMarginsGuide).inset(50)
            make.right.equalTo(self.layoutMarginsGuide).inset(offset)
            make.left.equalTo(self.layoutMarginsGuide).offset(offset)
            make.height.equalTo(100)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
