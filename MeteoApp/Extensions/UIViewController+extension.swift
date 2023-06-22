//
//  UIViewController+extension.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/21/23.
//

import Foundation
import UIKit

extension UIViewController {
    /// Set gradient of the background .
    /// Example:
    /// ```
    ///  override func viewDidLayoutSubviews() {
    ///    super.viewDidLayoutSubviews()
    ///    view.setBackgroundGradient(colors: appColors, isVertical: true)
    ///  }
    /// ```
    func setBackgroundGradient(gradientLayer:CAGradientLayer,colors:[CGColor],isVertical:Bool) {
        gradientLayer.colors = colors
        gradientLayer.startPoint = isVertical ? CGPoint(x: 0.5, y: 0) : CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = isVertical ? CGPoint(x: 0.5, y: 1) : CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at:0)
    }
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
