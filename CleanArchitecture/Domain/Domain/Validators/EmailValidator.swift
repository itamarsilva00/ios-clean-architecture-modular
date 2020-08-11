//
//  EmailValidator.swift
//  Validator
//
//  Created by Itamar Silva on 05/08/20.
//  Copyright © 2020 ioasys. All rights reserved.
//

import Foundation

enum EmailValidator {

    case input(String)
}

extension EmailValidator: Validatable {

    var result: ValidationResult {
        switch self {
        case .input(let input):
            if input.isEmpty {
                return .failure(.empty)
            } else if !input.isValidEmail {
                return .failure(.invalid)
            }
            return .success(())
        }
    }
}

fileprivate extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
}
