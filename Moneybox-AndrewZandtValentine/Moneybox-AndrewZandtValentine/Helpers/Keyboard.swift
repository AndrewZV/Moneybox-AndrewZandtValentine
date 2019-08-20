//
//  Keyboard.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 10/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

enum KeyboardType {
    case email, password, numbers, phonenumber, normal
}

//base keyboard templates
extension UITextField {
    func setUpKeyboard(_ type: KeyboardType, returnKeyType: UIReturnKeyType) {
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.keyboardAppearance = .default
        self.returnKeyType = returnKeyType
        self.clearButtonMode = .always
        
        switch type {
        case .email:
            self.keyboardType = UIKeyboardType.emailAddress
            
        case .password:
            self.keyboardType = UIKeyboardType.default
            self.isSecureTextEntry = true
            
        case .numbers:
            self.keyboardType = UIKeyboardType.numbersAndPunctuation
            
        case . phonenumber:
            self.keyboardType = UIKeyboardType.phonePad
            
        case .normal:
            self.keyboardType = UIKeyboardType.default
        }
    }
}
