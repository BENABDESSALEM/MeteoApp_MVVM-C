//
//  UITableView+extension.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/21/23.
//

import UIKit

extension UIView {
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
