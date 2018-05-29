//
//  RequestManager.swift
//  Login
//
//  Created by Anna on 10.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import Foundation
import Alamofire
import Unbox

struct URLConstants {
    static let baseURL = "https://apiecho.cf/api/"
    //
    static let signUpURL = "https://apiecho.cf/api/signup/"
    static let loginURL = "https://apiecho.cf/api/login/"
    static let getTextURL = "https://apiecho.cf/api/get/text/"
}
enum ServerError: Int {
    case unknownError = 0, clientError = 422
}

enum RequestError: Error {
    case unknownError
}

class RequestManager {
    static let shared = RequestManager()
    //
    typealias Success = (User) -> Void
    typealias Failure = (Error) -> Void
    //
    private(set) var currentUser: User?
    //
    var accessToken = ""
    
    func signUp(name: String, email: String, password: String, success: @escaping Success, failure: @escaping Failure) {
        
        let urlParams = ["name": name,
                         "email": email,
                         "password": password] as [String : String]
    
        Alamofire.request(URLConstants.signUpURL, method: .post, parameters: urlParams)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(let json):
                    guard let unboxableDictionary = json as? UnboxableDictionary else {
                        failure(RequestError.unknownError)
                        return
                    }
                    do {
                        let user: User = try unbox(dictionary: unboxableDictionary)
                        //
                        self.currentUser = user
                        self.accessToken = user.accessToken
                        //
                        success(user)
                    } catch let error {
                        failure(error)
                    }
                    
                case .failure(let error):
                    failure(error)
                }
        }
    }
    
    
    func login(email: String, password: String, success: @escaping Success, failure: @escaping Failure) {
        
        let param = ["email": email,
                     "password": password]
        
        Alamofire.request(URLConstants.loginURL, method: .post, parameters: param)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                    
                case .success(let json):
                    guard let unboxableDictionary = json as? UnboxableDictionary else {
                        failure(RequestError.unknownError)
                        return
                    }
                    do {
                        let user: User = try unbox(dictionary: unboxableDictionary)
                        //
                        self.currentUser = user
                        self.accessToken = user.accessToken
                        //
                        success(user)
                    } catch let error {
                        failure(error)
                    }
                    
                case .failure(let error):
                    failure(error)
                }
        }
        
    }
    
    func getText(success: @escaping (TextModel)->(), failure: @escaping Failure) {
        
        let headers = ["Authorization": "Bearer " + accessToken]
        
        Alamofire.request(URLConstants.getTextURL, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                    
                case .success(let json):
                    guard let unboxableDictionary = json as? UnboxableDictionary else {
                        failure(RequestError.unknownError)
                        return
                    }
                    do {
                        let text: TextModel = try unbox(dictionary: unboxableDictionary)
                        success(text)
                        
                    } catch let error {
                        failure(error)
                    }
                case .failure(let error):
                    failure(error)
                }
        }
    }
    
}
