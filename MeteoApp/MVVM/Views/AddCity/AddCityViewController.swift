//
//  ViewController.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import UIKit

class AddCityViewController: UIViewController {
    // MARK: Outlets.
    @IBOutlet weak var addCityTableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var containerSearchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel = AddCityViewModel(apiService: MeteoService())
    
    var gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
    // MARK: IBActions.
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        viewModel.getCityWeather()
    }
}

// MARK: - Initialisation & setup methods.

extension AddCityViewController {
    
    func setupBindings() {
        addCityTableView.bindTo(viewModel.results)
        searchButton.bindTo(viewModel.isButtonEnabled)
        activityIndicator.bindTo(viewModel.isLoadingEnabled)
    }
    
    func setupViews() {
        addCityTableView.dataSource = self
        addCityTableView.delegate = self
        addCityTableView.separatorColor = .clear
        addCityTableView.registerCell(type: CityTableViewCell.self)
        searchTextField.delegate = self
        containerSearchView.setCornerRadius(radius: 22)
        containerSearchView.addBorder(width: 1, color: .white)
        searchButton.setCornerRadius(radius: 22)
        searchButton.addBorder(width: 1, color: .white)
        hideKeyboardWhenTappedAround()
        view.setBackgroundGradient(gradientLayer:gradientLayer,colors: appColors, isVertical: true)
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
            let city = viewModel.results.value[indexPath.row]
            let cell:CityTableViewCell = tableView.dequeueCell(withType: CityTableViewCell.self)
            cell.containerView.layer.cornerRadius = 10
            cell.setupWith(city:city)
            cell.selectionStyle = .none
            return cell
    }
}

// MARK: - UITableViewDelegate.

extension AddCityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
}

// MARK: - UITextFieldDelegate.

extension AddCityViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel.getCityWeather()
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            if text.count >= 3 {
                viewModel.isButtonEnabled.value = true
            }else{
                viewModel.isButtonEnabled.value = false
            }
            viewModel.searchText = text
        }
        return true
    }
}

