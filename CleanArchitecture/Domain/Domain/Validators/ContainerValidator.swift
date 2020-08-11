//
//  ContainerValidator.swift
//  Validator
//
//  Created by Itamar Silva on 05/08/20.
//  Copyright © 2020 ioasys. All rights reserved.
//

import Foundation

protocol ContainerValidatable {

    var isValid: Bool { get }
}

class ContainerValidator {

    private let validators: [Validatable]

    init(validators: [Validatable]) {
        self.validators = validators
    }

}

extension ContainerValidator: ContainerValidatable {

    var isValid: Bool {
        return validators.compactMap({ $0.result.failure }).isEmpty
    }
}
