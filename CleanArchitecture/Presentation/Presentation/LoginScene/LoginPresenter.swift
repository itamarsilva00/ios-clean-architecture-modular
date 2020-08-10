//
//  LoginPresenter.swift
//  Presentation
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Foundation

public protocol LoginViewable: ViewLoadable {

    func showAlert(_ message: String)
}

public protocol LoginSceneCoordinating {
    func showHome()
}

public class LoginPresenter {

    private weak var view: LoginViewable?
    private let coodinator: LoginSceneCoordinating

    public init(coordinator: LoginSceneCoordinating) {
        self.coodinator = coordinator
    }

    public func attach(_ view: LoginViewable) {
        self.view = view
    }

}

extension LoginPresenter: LoginViewPresenting {

    public func logIn(email: String, password: String) {
        debugPrint(#function)
    }
}


