//
//  AuthenticationFactory.swift
//  Presentation
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import UIKit

public protocol AuthenticationFactory {

    func makeLoginViewController() -> LoginViewController
}
