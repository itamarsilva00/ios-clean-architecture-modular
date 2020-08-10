//
//  SceneDelegate.swift
//  CleanArchitecture
//
//  Created by Itamar Silva on 08/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import UIKit
import Presentation
import DependencyInjection

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var dependencyInjector: DependencyInjector?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)

        dependencyInjector = DependencyInjector(navigationController: UINavigationController())
        dependencyInjector?.build(completion: { appCoordinator in
            window?.makeKeyAndVisible()
            window?.windowScene = windowScene
            window?.rootViewController = appCoordinator.navigationController
            appCoordinator.start()
        })

    }
}
