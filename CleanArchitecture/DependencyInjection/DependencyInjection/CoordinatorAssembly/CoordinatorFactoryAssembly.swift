//
//  CoordinatorFactoryAssembly.swift
//  DependencyInjection
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Swinject
import Presentation

class CoordinatorFactoryAssembly: Assembly {

    func assemble(container: Container) {

        container.register(CoordinatorFactory.self) { resolver in
            return CoordinatorFactoryImplementation(resolver: resolver)
        }
    }
}
