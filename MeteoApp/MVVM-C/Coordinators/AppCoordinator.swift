//
//  AppCoordinator.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/22/23.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showCities()
    }
    
    func showCities() {
        let vc = CitiesViewController()
        vc.coordinator = self
        vc.viewModel = CitiesViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAddCity() {
        let vc = AddCityViewController()
        let meteoService = MeteoService()
        let viewModel = AddCityViewModel(apiService: meteoService)
        vc.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showCities(city:CityWeather) {
        let citiesVC = navigationController.viewControllers.filter { $0 is CitiesViewController }.first! as? CitiesViewController
        citiesVC?.viewModel.citiesList.value.append(city)
        navigationController.popToViewController(citiesVC!, animated: true)
    }
    
    func showDetail() {

    }
}
