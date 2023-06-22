//
//  UIViewController+extension.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/21/23.
//

import Foundation
import UIKit

extension UIViewController {
    /// Hide keyboard automatically after tapping around.
    ///
    /// Example:
    /// ```
    /// override func viewDidLoad() {
    ///      super.viewDidLoad()
    ///      self.hideKeyboardWhenTappedAround()
    /// }
    ///
    /// ```
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
