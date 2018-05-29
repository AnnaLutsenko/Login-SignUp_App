//
//  User.swift
//  Login
//
//  Created by Anna on 10.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import Foundation
import Unbox

struct User {
    var uid: Int
    var name: String
    var email: String
    var accessToken: String
}

extension User : Unboxable {
    init(unboxer: Unboxer) throws {
        self.uid = try unboxer.unbox(keyPath: "data.uid")
        self.name = try unboxer.unbox(keyPath: "data.name")
        self.email = try unboxer.unbox(keyPath: "data.email")
        self.accessToken = try unboxer.unbox(keyPath: "data.access_token")
    }
}
