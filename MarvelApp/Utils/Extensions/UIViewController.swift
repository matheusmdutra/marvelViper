//
//  UIViewController.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 16/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func findActiveTextField(_ subviews : [UIView]) -> UITextField? {
        for view in subviews {
            if let textField = view as? UITextField {
                if textField.isFirstResponder {
                    return textField
                }
            } else if !view.subviews.isEmpty {
                if let childTextField = findActiveTextField(view.subviews) {
                    return childTextField
                }
            }
        }
        return nil
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func findTopmostViewController() -> UIViewController {
        if let parentViewController = parent {
            return parentViewController.findTopmostViewController()
        } else {
            return self
        }
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view is UIButton {
            return false
        }
        return true
    }
}


