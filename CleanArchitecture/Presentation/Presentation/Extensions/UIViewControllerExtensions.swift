//
//  UIViewControllerExtensions.swift
//  Presentation
//
//  Created by Itamar Silva on 10/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import UIKit

extension UIViewController {

    func hideKeyboardWhenTapView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
