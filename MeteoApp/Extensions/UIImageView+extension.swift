//
//  UIImageView+extension.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/22/23.
//

import UIKit

extension UIImageView {
    
    /// Bind a UIImageView with data.
    ///
    /// Example:
    /// ```
    /// meteoImgView.bindTo(viewModel.pictoImage)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Bindable<String?>) {
        bindable.bind { [weak self] imgName in
           self?.image = UIImage(named:imgName ?? "")
        }
    }
}
