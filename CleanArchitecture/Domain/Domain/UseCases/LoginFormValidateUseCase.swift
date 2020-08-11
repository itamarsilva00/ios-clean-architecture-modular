//
//  LoginFormValidateUseCase.swift
//  Domain
//
//  Created by Itamar Silva on 05/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Foundation

public class LoginFormValidateUseCase {

    public init() {}
}

extension LoginFormValidateUseCase: LoginFormValidateUseCaseProtocol {

    public func execute(_ form: LoginForm, completion: (Result<Void, LoginFormValidateUseCaseError>) -> ()) {

        let emailValidator = EmailValidator.input(form.email)
        let passowordValidator = PasswordValidator.input(form.password)
        let containerValidator = ContainerValidator(validators: [emailValidator, passowordValidator])

        var errors: [LoginFormValidateUseCaseError] = []

        if containerValidator.isValid {
            completion(.success(()))
        } else {
            if let emailError = emailValidator.result.failure {
                errors.append(handleEmailError(emailError))
            }

            if let passwordError = emailValidator.result.failure {
                errors.append(handlePasswordError(passwordError))
            }

            errors.forEach { completion(.failure($0)) }
        }
    }

    private func handleEmailError(_ error: FormValidationError) -> LoginFormValidateUseCaseError {
        switch error {
        case .empty:
            return .email(.empty)
        case .invalid:
            return .email(.invalid)
        }
    }

    private func handlePasswordError(_ error: FormValidationError) -> LoginFormValidateUseCaseError {
        switch error {
        case .empty:
            return .password(.empty)
        case .invalid:
            return .password(.weak)
        }
    }
}
