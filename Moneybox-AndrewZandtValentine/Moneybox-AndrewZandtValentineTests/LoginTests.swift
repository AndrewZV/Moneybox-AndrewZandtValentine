//
//  LoginTests.swift
//  Moneybox-AndrewZandtValentineTests
//
//  Created by Andrew Zandt-Valentine on 20/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import XCTest
@testable import Moneybox_AndrewZandtValentine

class LoginTests: XCTestCase {

    let loginVC = LoginVC(nibName: nil, bundle: nil)

    //Check if empty email or password is flagged
    func testValidLoginDetails_emptyInput() {
        let input = ""
        let response = loginVC.loginDetailValidated(input: input)
        XCTAssertFalse(response)
    }
    
    //Check if correct email or password passes
    func testValidLoginDetails_validInput() {
        let input = "test@test.com"
        let response = loginVC.loginDetailValidated(input: input)
        XCTAssertTrue(response)
    }
    
    //Check 
    
}
