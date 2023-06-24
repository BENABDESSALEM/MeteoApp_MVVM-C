//
//  UICollectionView+extension.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/24/23.
//

import UIKit

extension UICollectionView {
    
    /// Bind a UICollectionViewCell in order to reload it automatically once the datasource array mutates
    ///
    /// Example:
    /// ```
    /// weatherCollectionViewCell.bindTo(viewModel.results)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo<T>(_ bindable: Bindable<T>) {
        bindable.bind { [weak self] _ in
            self?.reloadData()
        }
    }
    /**
     Register nibs faster by passing the type
     - Parameter type: UICollectionViewCell.Type
     */
    func registerCell(type: UICollectionViewCell.Type) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    /**
     DequeueCell by passing the type of UICollectionViewCell
     - Parameter indexPath:
     */
    func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
