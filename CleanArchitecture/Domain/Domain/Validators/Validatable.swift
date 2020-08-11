//
//  Validatable.swift
//  Validator
//
//  Created by Itamar Silva on 05/08/20.
//  Copyright © 2020 ioasys. All rights reserved.
//

import Foundation

enum FormValidationError: Error {
    case empty
    case invalid
}

typealias ValidationResult = Result<Void, FormValidationError>

protocol Validatable {

    var result: ValidationResult { get }
}
