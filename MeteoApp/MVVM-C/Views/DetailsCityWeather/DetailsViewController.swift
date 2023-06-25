//
//  DetailsViewController.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/24/23.
//

import UIKit

final class DetailsViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var averageTempLabel: UILabel!
    @IBOutlet weak var weatherImgView: UIImageView!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var weeklyContainerView: UIView!
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
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
    
    @IBAction func backButtonTapped(_ sender: Any) {
        coordinator?.goBack()
    }
}

// MARK: - Initialisation & setup methods.

extension DetailsViewController {
    /*
     Setup Views.
     */
    func setupViews() {
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
        weatherCollectionView.registerCell(type: WeekCollectionViewCell.self)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        weatherCollectionView.collectionViewLayout = layout
        weeklyContainerView.setCornerRadius(radius: 25)
        view.setBackgroundGradient(gradientLayer:gradientLayer,colors: appColors, isVertical: true)
    }
    
    /*
     Setup bindings.
     */
    func setupBindings() {
        weatherCollectionView.bindTo(viewModel.weatherList)
        cityNameLabel.bindTo(viewModel.cityName)
        tempLabel.bindTo(viewModel.temp)
        statusLabel.bindTo(viewModel.description)
        averageTempLabel.bindTo(viewModel.averageTemp)
        windSpeedLabel.bindTo(viewModel.windSpeed)
        weatherImgView.bindTo(viewModel.weatherImage)
    }
}

// MARK: - UICollectionViewDataSource.

extension DetailsViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.weatherList.value.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:WeekCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        let item = viewModel.weatherList.value[indexPath.row]
        let vm = WeekCellViewModel(item: item)
        cell.setupWith(viewModel: vm)
        return cell
    }
}

// MARK: - UICollectionViewDelegate.

extension DetailsViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dayWeather = viewModel.weatherList.value[indexPath.row]
        viewModel.weather = dayWeather
    }
}

// MARK: UICollectionViewDelegateFlowLayout.

extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 1.0
        let numberOfItemsPerRow: CGFloat = 5.0
        let width = (collectionView.frame.width-padding)/numberOfItemsPerRow
        return CGSize(width: width, height: 128)
    }
}
