//
//  CoordinatorFactory.swift
//  Presentation
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

public protocol CoordinatorFactory {

    func makeAuthenticationCoordinator() -> AuthenticationCoordinator
}
