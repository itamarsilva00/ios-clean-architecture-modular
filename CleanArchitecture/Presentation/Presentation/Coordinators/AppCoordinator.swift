//
//  AppCoordinator.swift
//  Presentation
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import UIKit

public class AppCoordinator: Coordinator {

    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    private let coordinatorFactory: CoordinatorFactory

    public init(navigationController: UINavigationController, coordinatorFactory: CoordinatorFactory) {
        self.navigationController = navigationController
        self.coordinatorFactory = coordinatorFactory
    }

    public func start() {
        showAuthenticationFlow()
    }

    func showAuthenticationFlow() {
        let authenticationCoordinator = coordinatorFactory.makeAuthenticationCoordinator()
        authenticationCoordinator.start()
        childCoordinators.append(authenticationCoordinator)
    }

}

extension AppCoordinator: AuthenticationCoordinatorDelegate {

    public func didAuthenticate(_ coordinator: AuthenticationCoordinator) {
        #warning("TODO - Presente home")
        coordinatorDidExit(coordinator)
    }
}
