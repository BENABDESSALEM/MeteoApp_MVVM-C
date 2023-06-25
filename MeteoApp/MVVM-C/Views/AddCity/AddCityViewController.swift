//
//  AddCityViewController.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/24/23.
//

import UIKit

class AddCityViewController: UIViewController {
    
    // MARK: - Outlets.
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    // MARK: - Variables.
    var viewModel: AddCityViewModel!
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
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        viewModel.getCity()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        coordinator?.goBack()
    }
}


// MARK: - Initialisation & setup methods.

extension AddCityViewController {
    /*
     Setup Views.
     */
    func setupViews() {
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.separatorColor = .clear
        cityTableView.registerCell(type: CityTableViewCell.self)
        searchTextField.delegate = self
        searchButton.setCornerRadius(radius: 10)
        searchView.setCornerRadius(radius: 25)
        searchView.addBorder(width: 1, color: .lightGray)
        searchButton.setBackgroundGradient(colors: buttonColors, isVertical: false)
        view.setBackgroundGradient(gradientLayer:gradientLayer,colors: appColors, isVertical: true)
    }
    
    /*
     Setup bindings.
     */
    func setupBindings() {
        cityTableView.bindTo(viewModel.results)
        alertLabel.bindTo(viewModel.showAlert)
        searchButton.bindTo(viewModel.isButtonEnabled)
        activityIndicatorView.bindTo(viewModel.isLoadingEnabled)
    }
}

// MARK: - UITableViewDataSource.

extension AddCityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
          return viewModel.results.value.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityWeather = viewModel.results.value[indexPath.row]
        let vm = CityCellViewModel(city: cityWeather)
        vm.isAddCity = true
        let cell:CityTableViewCell = tableView.dequeueCell(withType: CityTableViewCell.self)
        cell.setupWith(viewModel:vm)
        return cell
    }
}

// MARK: - UITableViewDelegate.

extension AddCityViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = viewModel.results.value[indexPath.row]
        coordinator?.showCities(city: city)
    }
}

// MARK: - UITextFieldDelegate.

extension AddCityViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel.getCity()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            viewModel.searchText = text
            viewModel.isButtonEnabled.value =  text.count >= 3 ? true : false
        }
        return true
    }
}
