//
//  UITableView+extension.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation
import UIKit

extension UITableView {
    
    /// Bind a UITableView in order to reload it automatically once the datasource array mutates
    ///
    /// Example:
    /// ```
    /// tableView.bindTo(viewModel.results)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo<T>(_ bindable: Bindable<T>) {
        bindable.bind { [weak self] _ in
            self?.reloadData()
        }
    }
    /**
     Register nibs faster by passing the type
     - Parameter type: UITableViewCell.Type
     */
    func registerCell(type: UITableViewCell.Type) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    /**
     DequeueCell by passing the type of UITableViewCell
     - Parameter type: UITableViewCell.Type
     */
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: type)) as! T
    }
}
