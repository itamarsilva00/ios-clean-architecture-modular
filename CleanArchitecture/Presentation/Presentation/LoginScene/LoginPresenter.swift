//
//  LoginPresenter.swift
//  Presentation
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Foundation
import Domain

public protocol LoginViewable: ViewLoadable {

    func showAlert(_ message: String)
    func showEmailError(_ message: String)
    func showPasswordError(_ message: String)
}

public protocol LoginSceneCoordinating {
    func showHome()
}

public class LoginPresenter {

    private weak var view: LoginViewable?
    private let coodinator: LoginSceneCoordinating
    private let formValidateUseCase: LoginFormValidateUseCaseProtocol

    public init(coordinator: LoginSceneCoordinating, formValidateUseCase: LoginFormValidateUseCaseProtocol) {
        self.coodinator = coordinator
        self.formValidateUseCase = formValidateUseCase
    }

    public func attach(_ view: LoginViewable) {
        self.view = view
    }

}

extension LoginPresenter: LoginViewPresenting {

    public func logIn(email: String, password: String) {

        let loginForm = LoginForm(email: email, password: password)
        formValidateUseCase.execute(loginForm) { result in

            switch result {
            case .success:
                coodinator.showHome()
            case .failure(let error):
                switch error {
                case .email(let emailError):
                    handleBusinessEmailError(emailError)
                case .password(let passwordError):
                    handleBusinessPasswordError(passwordError)
                }
            }
        }
    }

    private func handleBusinessEmailError(_ error: LoginFormValidateUseCaseError.Email) {
        switch error {
        case .empty:
            view?.showEmailError("Campo de e-mail vazio")
        case .invalid:
            view?.showEmailError("E-mail inválido")
        }
    }

    private func handleBusinessPasswordError(_ error: LoginFormValidateUseCaseError.Password) {
        switch error {
        case .empty:
            view?.showPasswordError("Campo de senha vazio")
        case .weak:
            view?.showPasswordError("Senha fraca :(")
        }
    }
}


