//
//  UIViewExtensions.swift
//  Presentation
//
//  Created by Itamar Silva on 09/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import UIKit

extension UIView {

    @discardableResult func addConstraint(
        attribute: NSLayoutConstraint.Attribute, alignElement: Any?, alignElementAttribute: NSLayoutConstraint.Attribute,
        constant: CGFloat = 0, typeSize: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1) -> NSLayoutConstraint {

        self.translatesAutoresizingMaskIntoConstraints = false

        let constraint = NSLayoutConstraint(
            item: self,
            attribute: attribute,
            relatedBy: typeSize,
            toItem: alignElement,
            attribute: alignElementAttribute,
            multiplier: multiplier,
            constant: (attribute == .right || attribute == .bottom) ? (constant * -1) : constant
        )
        constraint.isActive = true
        return constraint
    }

}
