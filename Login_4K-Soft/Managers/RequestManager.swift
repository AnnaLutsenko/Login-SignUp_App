//
//  RequestManager.swift
//  Login_4K-Soft
//
//  Created by Anna on 10.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import Foundation
import Alamofire

struct URLConstants {
    static let signInURL = "http://api.crmsport.ru/users/sign_in"
}
enum RequestError : Error {
    case unknownError
}

class RequestManager {
    typealias Success = () -> Void
    typealias Failure = (Error) -> Void
    
    func signIn(email: String, password: String, success: @escaping Success, failure: @escaping Failure) {
        
        let urlParams = ["email": email, "password": password] as [String : String]
    
        Alamofire.request(URLConstants.signInURL, method: .post, parameters: urlParams)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(let json):
                    
                    print(json)
                    
                case .failure(let error):
                    failure(error)
                }
        }
        
    }
    
    
}
