//
//  NetworkVerificationHandler.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 18/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

struct NetworkVerificationHandler {
    
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func login(completion: @escaping(NetworkLoginResult) -> Void) {
        
        let loginURL = "https://api-test01.moneyboxapp.com/users/login"
        
        let parameters = [
            "Email": email,
            "Password": password,
            "Idfa": "the idfa of the ios device"
        ]
        
        guard let request = HttpRequestBuilder().createRequest(url: loginURL, method: .post, bodyParameters: parameters) else {
            print("Could not create the request")
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard let data = data else {
                print("Unable to retrieve data.")
                return
            }
            
            do{
                let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                
                guard let session = jsonData["Session"] as? [String : Any] else {
                    completion(.failure(.invalidDetails))
                    return
                }
                guard let bToken = session["BearerToken"] as? String,
                    let userInfo = jsonData["User"] as? [String : Any],
                    let firstName = userInfo["FirstName"] as? String
                    else {
                        completion(.failure(.serverError))
                        return
                }
                let bearerToken = "Bearer " + bToken
                completion(.success((bearerToken, firstName)))
            } catch {
                print("Could not serialize json")
            }
        }.resume()
    }
}
