//
//  Coordinator.swift
//  Presentation
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import UIKit

public protocol CoordinatorDelegate: class {

    func coordinatorDidExit(_ coordinator: Coordinator)
}

public protocol Coordinator: CoordinatorDelegate {

    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    func start()

}

extension Coordinator {

    public func coordinatorDidExit(_ coordinator: Coordinator) {

        guard let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) else { return }
        self.childCoordinators.remove(at: index)

    }
}

