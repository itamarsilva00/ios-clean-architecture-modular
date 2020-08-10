//
//  Defaultable.swift
//  Presentation
//
//  Created by Itamar Silva on 10/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Foundation

protocol Defaultable {
    static var defaultValue: Self { get }
}

extension Optional where Wrapped: Defaultable {
    var defaultValue: Wrapped { return self ?? Wrapped.defaultValue }
}

extension String: Defaultable {
    static var defaultValue: String {
        ""
    }
}
