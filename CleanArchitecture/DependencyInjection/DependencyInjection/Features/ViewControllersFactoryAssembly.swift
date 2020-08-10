//
//  ViewControllersFactoryAssembly.swift
//  DependencyInjection
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Swinject
import Presentation

class ViewControllersFactoryAssembly: Assembly {

    func assemble(container: Container) {

        container.register(AuthenticationFactory.self) { resolver in
            return AuthenticationFactoryImplementation(resolver: resolver)
        }
    }
}
