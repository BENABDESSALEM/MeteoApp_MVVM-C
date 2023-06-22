//
//  UITextField+extension.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/21/23.
//

import Foundation
import UIKit

extension UITextField {
    
    /// Bind a UITextField with string data.
    ///
    /// Example:
    /// ```
    /// searchTextField.bindTo(viewModel.searchText)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Bindable<String?>) {
        bindable.bind { [weak self] text in
            self?.text = text
        }
    }
}
