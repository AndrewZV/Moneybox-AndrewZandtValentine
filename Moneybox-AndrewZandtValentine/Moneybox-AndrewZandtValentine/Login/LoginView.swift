//
//  LoginView.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 10/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    // MARK: Text Enum
    enum Text: String {
        case email, password
        case login = "Log In"
        case logo = "moneybox"
    }
    
    // MARK: Subviews
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Text.email.rawValue.capitalized
        textField.font = UIFont(name: AppFonts.avenirNextRegular.rawValue, size: 20.0)
        textField.textColor = UIColor.AppColours.darkGrey
        textField.minimumFontSize = 20.0
        textField.borderStyle = .roundedRect
        textField.setUpKeyboard(KeyboardType.email, returnKeyType: UIReturnKeyType.next)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Text.password.rawValue.capitalized
        textField.font = UIFont(name: AppFonts.avenirNextRegular.rawValue, size: 20.0)
        textField.textColor = UIColor.AppColours.darkGrey
        textField.minimumFontSize = 20.0
        textField.borderStyle = .roundedRect
        textField.setUpKeyboard(KeyboardType.password, returnKeyType: UIReturnKeyType.send)
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: AppFonts.avenirNextRegular.rawValue, size: 20.0)
        button.setTitle(Text.login.rawValue, for: .normal)
        button.setTitleColor(UIColor.AppColours.white, for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.borderColor = UIColor.AppColours.white.cgColor
        button.layer.borderWidth = 1.0
        button.set(cornerRadius: 5.0)
        return button
    }()
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [self.emailTextField, self.passwordTextField, self.loginButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10.0
        return stackView
    }()
    
    let logoLabel: UILabel = {
        let label = UILabel()
        label.text = Text.logo.rawValue
        label.font = UIFont(name: AppFonts.avenirNextRegular.rawValue, size: 60.0)
        label.textColor = UIColor.AppColours.white
        label.backgroundColor = UIColor.clear
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.AppColours.moneyboxBlue
        
        setSubviewsForAutoLayout([stackView, logoLabel])
        
        stackView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(40.0)
            make.trailing.equalToSuperview().inset(40.0)
        }
        
        emailTextField.snp.makeConstraints { [unowned self] (make) in
            make.height.equalTo(self).multipliedBy(0.075)
        }
        
        logoLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(40.0)
            make.left.equalToSuperview().offset(40.0)
            make.right.equalToSuperview().inset(40.0)
            make.bottom.equalTo(stackView.snp.top).inset(50.0)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
