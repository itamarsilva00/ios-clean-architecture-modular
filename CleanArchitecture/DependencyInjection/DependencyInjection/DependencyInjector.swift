//
//  DependencyInjector.swift
//  DependencyInjection
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import Presentation

public class DependencyInjector {

    private let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func build(completion: (_ appCoordinator: AppCoordinator) -> ()) {
        let assembler = Assembler([
            CoordinatorFactoryAssembly(),
            ViewControllersFactoryAssembly(),
            CoordinatorAssembly(navigationController: self.navigationController),
            AuthenticationFlowAssembly()
        ])

        let appCoordinator = assembler.resolver.resolveSafe(AppCoordinator.self)
        completion(appCoordinator)
    }

}
