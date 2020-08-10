//
//  LoginView.swift
//  Presentation
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func didTapLogin(_ email: String, password: String)
}

class LoginView: UIView {

    private struct Metrics {
        struct Title {
            static let titleFontSize: CGFloat = 32.0
            static let height: CGFloat = 36.0
            static let top: CGFloat = 64.0
        }

        struct Fields {
            static let textFieldHeight: CGFloat = 44.0
        }

        struct StackView {
            static let left: CGFloat = 24.0
            static let right: CGFloat = 24.0
            static let space: CGFloat = 32.0
        }

        struct LoginButton {
            static let height: CGFloat = 44.0
            static let left: CGFloat = 24.0
            static let right: CGFloat = 24.0
            static let top: CGFloat = 64.0
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: Metrics.Title.titleFontSize)
        return label
    }()

    private lazy var fieldsSctackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = Metrics.StackView.space
        return stackView
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("LOGIN", for: .normal)
        button.layer.cornerRadius = 4.0
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return button
    }()

    weak var delegate: LoginViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func loginAction() {
        delegate?.didTapLogin(emailTextField.text.defaultValue,
                              password: passwordTextField.text.defaultValue)
    }
}

extension LoginView: ConfigurableView {

    func buildViewHierarchy() {
        addSubview(titleLabel)
        fieldsSctackView.addArrangedSubview(emailTextField)
        fieldsSctackView.addArrangedSubview(passwordTextField)
        addSubview(fieldsSctackView)
        addSubview(loginButton)
    }

    func setupConstraints() {
        setupTitleConstraints()
        setupStackViewConstaints()
        setupFieldsConstraints()
        setupLoginButtonConstraints()
    }

    private func setupTitleConstraints() {
        titleLabel.addConstraint(attribute: .top, alignElement: self,
                                 alignElementAttribute: .top, constant: Metrics.Title.top)
        titleLabel.addConstraint(attribute: .centerX, alignElement: self,
                                 alignElementAttribute: .centerX)
    }

    private func setupStackViewConstaints() {
        fieldsSctackView.addConstraint(attribute: .centerX, alignElement: self,
                                       alignElementAttribute: .centerX)
        fieldsSctackView.addConstraint(attribute: .centerY, alignElement: self,
                                       alignElementAttribute: .centerY)
        fieldsSctackView.addConstraint(attribute: .left, alignElement: self,
                                       alignElementAttribute: .left, constant: Metrics.StackView.left)
        fieldsSctackView.addConstraint(attribute: .right, alignElement: self,
                                       alignElementAttribute: .right, constant: Metrics.StackView.right)
    }

    private func setupFieldsConstraints() {
        emailTextField.addConstraint(attribute: .height, alignElement: nil,
                                     alignElementAttribute: .notAnAttribute, constant: Metrics.Fields.textFieldHeight)

        passwordTextField.addConstraint(attribute: .height, alignElement: nil,
                                        alignElementAttribute: .notAnAttribute, constant: Metrics.Fields.textFieldHeight)
    }

    private func setupLoginButtonConstraints() {
        loginButton.addConstraint(attribute: .height, alignElement: nil,
                                  alignElementAttribute: .notAnAttribute, constant: Metrics.LoginButton.height)
        loginButton.addConstraint(attribute: .left, alignElement: self,
                                  alignElementAttribute: .left, constant: Metrics.LoginButton.left)
        loginButton.addConstraint(attribute: .right, alignElement: self,
                                  alignElementAttribute: .right, constant: Metrics.LoginButton.right)
        loginButton.addConstraint(attribute: .top, alignElement: fieldsSctackView,
                                  alignElementAttribute: .bottom, constant: Metrics.LoginButton.top)
    }

}
