//
//  CitiesViewController.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/22/23.
//

import UIKit

final class CitiesViewController: UIViewController {
    
    // MARK: - Outlets.
    @IBOutlet weak var citiesTableView: UITableView!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var addCityButton: UIButton!
    
    // MARK: - Variables.
    var viewModel: CitiesViewModel!
    weak var coordinator: AppCoordinator?
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBindings()
        viewModel.checkData()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    /*
     Navigate to the Cities page.
     */
    @IBAction func addCityTapped(_ sender: Any) {
        coordinator?.showAddCity()
    }
}

// MARK: - Initialisation & setup methods.

extension CitiesViewController {
    /*
     Setup Views.
     */
    func setupViews() {
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        citiesTableView.separatorColor = .clear
        citiesTableView.registerCell(type: CityTableViewCell.self)
        addCityButton.setCornerRadius(radius: 10)
        addCityButton.setBackgroundGradient(colors: buttonColors, isVertical: false)
        view.setBackgroundGradient(gradientLayer:gradientLayer,colors: appColors, isVertical: true)
    }
    
    /*
     Setup bindings.
     */
    func setupBindings() {
        citiesTableView.bindTo(viewModel.citiesList)
        alertLabel.bindTo(viewModel.showList)
    }
}

// MARK: - UITableViewDataSource.

extension CitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
          return viewModel.citiesList.value.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityWeather = viewModel.citiesList.value[indexPath.row]
        let vm = CityCellViewModel(city: cityWeather)
        vm.isAddCity = false
        let cell:CityTableViewCell = tableView.dequeueCell(withType: CityTableViewCell.self)
        cell.setupWith(viewModel:vm)
        return cell
    }
}

// MARK: - UITableViewDelegate.

extension CitiesViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = viewModel.citiesList.value[indexPath.row]
        coordinator?.showDetail(city:city)
    }
}
