//
//  AuthenticationCoordinator.swift
//  Presentation
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import UIKit

public protocol AuthenticationCoordinatorDelegate: CoordinatorDelegate {
    func didAuthenticate(_ coordinator: AuthenticationCoordinator)
}

public class AuthenticationCoordinator: Coordinator {

    weak var coordinatorDelegate: AuthenticationCoordinatorDelegate?
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    private let authenticationFactory: AuthenticationFactory

    public init(navigationController: UINavigationController, delegate: AuthenticationCoordinatorDelegate,
         authenticationFactory: AuthenticationFactory) {

        self.navigationController = navigationController
        self.coordinatorDelegate = delegate
        self.authenticationFactory = authenticationFactory
    }

    public func start() {
        let loginViewController = authenticationFactory.makeLoginViewController()
        navigationController.pushViewController(loginViewController, animated: true)
    }

}

extension AuthenticationCoordinator: LoginSceneCoordinating {

    public func showHome() {
        coordinatorDelegate?.didAuthenticate(self)
    }
}

