//
//  UITableView+extension.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/21/23.
//

import UIKit

extension UIView {
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
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at:0)
    }
    /// Set the corner radius of the view .
    /// Example:
    /// ```
    /// searchTextField.setCornerRadius(radius: 22)
    /// ```
    func setCornerRadius(radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    /// Set the border width of the view .
    /// Example:
    /// ```
    ///  searchButton.addBorder(width: 1, color: .white)
    /// ```
    func addBorder(width:CGFloat,color:UIColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }
}
