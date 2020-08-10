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

    weak var delegate: LoginViewDelegate?
    
}
