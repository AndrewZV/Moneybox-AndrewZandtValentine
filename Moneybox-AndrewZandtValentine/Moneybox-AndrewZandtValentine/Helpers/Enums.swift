//
//  Enums.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 12/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

//fonts
enum AppFont: String {
    case avenirNextRegular = "AvenirNext-Regular"
    case avenirNextMedium = "AvenirNext-Medium"
    case avenirNextBold = "AvenirNext-Bold"
}

//network methods
enum NetworkHttpMethod: String {
    case post = "POST"
    case get = "GET"
}

//login errors
enum LoginError: Error {
    case invalidDetails
    case serverError
}

enum NetworkLoginResult {
    case success((String, String))
    case failure(LoginError)
}

enum NetworkPaymentResult {
    case success(Double)
    case failure(String)
}
