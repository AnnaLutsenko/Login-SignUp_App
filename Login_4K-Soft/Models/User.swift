//
//  User.swift
//  Login_4K-Soft
//
//  Created by Anna on 10.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import Foundation
import Unbox

struct User {
    var id: Int?
    var email: String?
    var firstName: String?
    var lastName: String?
    var appointment: String?
    var company: String?
    var phone: String?
}

extension User : Unboxable {
    init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.email = try? unboxer.unbox(key: "email")
        self.firstName = try? unboxer.unbox(key: "first_name")
        self.lastName = try? unboxer.unbox(key: "last_name")
        self.appointment = try? unboxer.unbox(key: "appointment")
        self.company = try? unboxer.unbox(key: "company")
        self.phone = try? unboxer.unbox(key: "phone")
    }
}
