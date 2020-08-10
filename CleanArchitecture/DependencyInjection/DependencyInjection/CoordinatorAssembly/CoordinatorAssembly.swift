//
//  CoordinatorAssembly.swift
//  DependencyInjection
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Swinject
import Presentation

class CoordinatorAssembly: Assembly {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func assemble(container: Container) {
        let coordinatorFactory = container.resolveSafe(CoordinatorFactory.self)

        //MARK: App Coordinator
        container.register(AppCoordinator.self) { resolver in
            let appCoordinator = AppCoordinator(navigationController: self.navigationController,
                                                coordinatorFactory: coordinatorFactory)
            return appCoordinator
        }

        let appCoordinator = container.resolveSafe(AppCoordinator.self)

        //MARK: Authentication Coordinator
        container.register(AuthenticationCoordinator.self) { resolver in
            let authViewControllersFactory = resolver.resolveSafe(AuthenticationFactory.self)
            let authCoordinator = AuthenticationCoordinator(navigationController: appCoordinator.navigationController,
                                                            delegate: appCoordinator, authenticationFactory: authViewControllersFactory)
            return authCoordinator
        }

    }
}
