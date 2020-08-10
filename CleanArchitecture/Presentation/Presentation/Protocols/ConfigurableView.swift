//
//  ConfigurableView.swift
//  Presentation
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Foundation

protocol ConfigurableView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupView()
}

extension ConfigurableView {
    
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
    }
}
