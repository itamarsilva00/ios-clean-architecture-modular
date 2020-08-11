//
//  DomainAssembly.swift
//  DependencyInjection
//
//  Created by Itamar Silva on 10/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Swinject
import Domain

class DomainAssembly: Assembly {

    func assemble(container: Container) {

        container.register(Domain.LoginFormValidateUseCaseProtocol.self) { _ in
            LoginFormValidateUseCase()
        }
    }

}

