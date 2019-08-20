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
        label.font = UIFont(name: AppFont.avenirNextBold.rawValue, size: 20.0)
        label.textColor = UIColor.AppColours.white
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        return label
    }()
    
    let accountValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFont.avenirNextMedium.rawValue, size: 18.0)
        label.textColor = UIColor.AppColours.white
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        return label
    }()
    
    let accountMoneyboxLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFont.avenirNextMedium.rawValue, size: 18.0)
        label.textColor = UIColor.AppColours.white
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
        stackView.spacing = 5.0
        stackView.isUserInteractionEnabled = false
        return stackView
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.set(cornerRadius: 20.0)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
        
        setSubviewForAutoLayout(backView)
        backView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
        
        backView.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().inset(15)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
