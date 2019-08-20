//
//  HttpRequestBuilder.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 19/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

struct HttpRequestBuilder {
    
    private var headerValues = [
        "AppId": "8cb2237d0679ca88db6464",
        //self.headerValues["Content-Type"] = "application/json",
        "appVersion": "4.0.0",
        "apiVersion": "3.0.0"
    ]
    
    init() {}
    
    init(headerAdditions: [String: String]) {     
        for (key, value) in headerAdditions {
            headerValues[key] = value
        }
    }
    
    func createRequest(url: String, method: NetworkHttpMethod,
                       additionalHeaderValues: [String: String] = [String: String](),
                       bodyParameters: [String: Any] = [String: String]()
                      ) -> URLRequest? {
        
        guard let newUrl = URL(string: url) else {     //set URL
            print("Invalid URL String")
            return nil
        }
        
        let mergedHeaderValues = headerValues.merging(additionalHeaderValues, uniquingKeysWith: { (_, last) in last })
        
        var request = URLRequest(url: newUrl)
        for (field, value) in mergedHeaderValues {                //Add headers to request
            request.setValue(value, forHTTPHeaderField: field)
        }
        request.httpMethod = method.rawValue                          //Specify GET request
        
        request.httpBody = bodyParameters.percentEscaped().data(using: .utf8)
        
        return request
    }
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
