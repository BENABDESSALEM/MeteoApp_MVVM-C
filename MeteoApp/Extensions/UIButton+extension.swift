//
//  UIButton+extension.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/21/23.
//

import Foundation
import UIKit

extension UIButton {
    
    /// Bind a UIButton in order to enable/disable it automatically
    ///
    /// Example:
    /// ```
    /// btnSearch.bindTo(viewModel.isButtonEnabled)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Bindable<Bool>) {
        bindable.bind { [weak self] isEnabled in
            self?.isEnabled = isEnabled
            self?.alpha = isEnabled ? 1.0 : 0.5
        }
    }
}
