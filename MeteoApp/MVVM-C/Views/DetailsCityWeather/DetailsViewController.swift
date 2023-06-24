//
//  DetailsViewController.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/24/23.
//

import UIKit

final class DetailsViewController: UIViewController {

    // MARK: - Variables.
    var viewModel: DetailsViewModel!
    weak var coordinator: AppCoordinator?
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
}

// MARK: - Initialisation & setup methods.

extension DetailsViewController {
    /*
     Setup Views.
     */
    func setupViews() {
        view.setBackgroundGradient(gradientLayer:gradientLayer,colors: appColors, isVertical: true)
    }
    
    /*
     Setup bindings.
     */
    func setupBindings() {

    }
}
