//
//  AuthenticationFlowAssembly.swift
//  DependencyInjection
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Swinject
import Presentation

class AuthenticationFlowAssembly: Assembly {

    func assemble(container: Container) {
        let authCoordinator = container.resolveSafe(AuthenticationCoordinator.self)

        //MARK: LoginScene
        container.register(LoginSceneCoordinating.self) { _ in authCoordinator}
        container.autoregister(LoginViewPresenting.self, initializer: LoginPresenter.init)
    }
}
