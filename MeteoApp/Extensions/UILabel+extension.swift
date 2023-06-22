//
//  UILabel+extension.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/21/23.
//

import Foundation
import UIKit

extension UILabel {
    
    /// Bind a UILabel with string data.
    ///
    /// Example:
    /// ```
    /// cityName.bindTo(viewModel.description)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Bindable<String?>) {
        bindable.bind { [weak self] text in
            self?.text = text
        }
    }
    /// Bind a UILabel in order to hide/show according to boolean value
    ///
    /// Example:
    /// ```
    /// alertLabel.bindTo(viewModel.isDataReady)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Bindable<Bool>) {
        bindable.bind { [weak self] isDataReady in
           self?.isHidden = !isDataReady
        }
    }
}
