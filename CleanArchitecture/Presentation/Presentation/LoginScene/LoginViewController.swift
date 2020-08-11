//
//  LoginViewController.swift
//  Presentation
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import UIKit

public protocol LoginViewPresenting: AnyObject {
    func logIn(email: String, password: String)
}

public class LoginViewController: UIViewController {

    private lazy var loginView = LoginView()
    private let presenter: LoginViewPresenting

    public init(presenter: LoginViewPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
        hideKeyboardWhenTapView()
    }

    public override func loadView() {
        view = loginView
        loginView.delegate = self
    }

}

// MARK: LoginViewDelegate

extension LoginViewController: LoginViewDelegate {

    func didTapLogin(_ email: String, password: String) {
        presenter.logIn(email: email, password: password)
    }
}

//MARK:

extension LoginViewController: LoginViewable {

    public func showLoading() {
        debugPrint(#function)
    }

    public func hideLoading() {
        debugPrint(#function)
    }

    public func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Aviso", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }

    public func showEmailError(_ message: String) {
        debugPrint(#function)
    }

    public func showPasswordError(_ message: String) {
        debugPrint(#function)
    }

}
