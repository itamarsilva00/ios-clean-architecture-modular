//
//  CoordinatorFactoryImplementation.swift
//  DependencyInjection
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Swinject
import Presentation

class CoordinatorFactoryImplementation {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }

}

extension CoordinatorFactoryImplementation: CoordinatorFactory {
    
    func makeAuthenticationCoordinator() -> AuthenticationCoordinator {
        resolver.resolveSafe(AuthenticationCoordinator.self)
    }
}
