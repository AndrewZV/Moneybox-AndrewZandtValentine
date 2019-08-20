//
//  NetworkDataHandler.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 18/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

struct NetworkDataHandler {
    
    private var tokenHeaderValue: [String: String]
    
    init(bearerToken: String) {
        self.tokenHeaderValue = [String: String]()
        self.tokenHeaderValue["Authorization"] = bearerToken
    }
    
    func getAccounts(completion: @escaping([Account]?, Error?) -> Void) {
        let accountsURL = "https://api-test01.moneyboxapp.com/investorproduct/thisweek"
        
        guard let request = HttpRequestBuilder().createRequest(url: accountsURL, method: .get, additionalHeaderValues: tokenHeaderValue) else {
            print("Could not create the request")
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else {
                print("Unable to retrieve data.")
                return
            }
            
            do{
                let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                
                guard let jsonProducts = jsonData["Products"] as? NSArray else {
                    print("Cannot find Products Array")
                    return
                }
                
                var products = [Account]()
                for jsonProduct in jsonProducts {
                    guard let product = jsonProduct as? [String : Any] else {
                        print("Could not cast json product to dictionary")
                        return
                    }
                    
                    guard let productDetails = product["Product"] as? [String : Any] else {
                        print("Could not cast json product details to dictionary")
                        return
                    }
                    
                    guard
                        let name = productDetails["FriendlyName"] as? String,
                        let id = product["InvestorProductId"] as? Int,
                        let value = product["PlanValue"] as? Double,
                        let moneybox = product["Moneybox"] as? Double
                    else {
                        print("Could not find required product details")
                        return
                    }
                    
                    products.append(Account(name: name, id: id, value: value, moneybox: moneybox))
                }

                completion(products, nil)
                
            } catch {
                completion(nil, error)
                print(error)
            }
        }.resume()
    }
    
    func oneOffPayment(amount: Double, productId: Int, completion: @escaping(NetworkPaymentResult) -> Void) {
        
        let paymentURL = "https://api-test01.moneyboxapp.com/oneoffpayments"
        
        let parameters: [String: Any] = [
            "Amount": amount,
            "InvestorProductId": productId
        ]
        
        guard let request = HttpRequestBuilder().createRequest(url: paymentURL, method: .post, additionalHeaderValues: tokenHeaderValue, bodyParameters: parameters) else {
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
                
                guard let newMoneybox = jsonData["Moneybox"] as? Double else {
                    print("Could not cast new moneybox to double")
                    
                    completion(.failure(jsonData["Message"] as! String))
                    return
                }
                
                completion(.success(newMoneybox))
            } catch {
                print(error)
            }
        }.resume()
    }
}
