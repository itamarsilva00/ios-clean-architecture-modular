//
//  AuthenticationFactoryImplementation.swift
//  DependencyInjection
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Swinject
import Presentation

class AuthenticationFactoryImplementation {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }
}

extension AuthenticationFactoryImplementation: AuthenticationFactory {

    func makeLoginViewController() -> LoginViewController {
        guard let presenter = resolver.resolve(LoginViewPresenting.self) as? LoginPresenter else {
            preconditionFailure("LoginViewPresenting is nil")
        }
        let loginViewController = LoginViewController(presenter: presenter)
        presenter.attach(loginViewController)
        return loginViewController
    }
}
