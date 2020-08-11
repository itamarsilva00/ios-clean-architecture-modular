//
//  LoginForm.swift
//  Domain
//
//  Created by Itamar Silva on 05/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Foundation

public struct LoginForm {

    public let email: String
    public let password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
