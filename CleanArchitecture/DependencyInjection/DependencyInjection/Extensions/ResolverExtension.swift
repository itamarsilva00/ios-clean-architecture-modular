//
//  ResolverExtension.swift
//  DependencyInjection
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Swinject

extension Resolver {
    public func resolveSafe<Service>(_ serviceType: Service.Type) -> Service {
        guard let dependency = resolve(serviceType, name: nil) else {
            preconditionFailure("\(serviceType) is nil")
        }
        return dependency
    }

    public func resolveSafe<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service {
        guard let service = resolve(serviceType, argument: argument) else {
            preconditionFailure("\(serviceType) is nil")
        }
        return service
    }
}
