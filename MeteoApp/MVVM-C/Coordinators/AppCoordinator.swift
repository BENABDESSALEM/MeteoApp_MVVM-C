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
    /*
     Navigate to the CitiesViewController
     */
    func showCities() {
        let vc = CitiesViewController()
        vc.coordinator = self
        vc.viewModel = CitiesViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
    /*
     Navigate to the AddCityViewController
     */
    func showAddCity() {
        let vc = AddCityViewController()
        let meteoService = MeteoService()
        let vm = AddCityViewModel(apiService: meteoService)
        vm.showAlert.value = true
        vc.coordinator = self
        vc.viewModel = vm
        navigationController.pushViewController(vc, animated: true)
    }
    /*
     Navigate to the CitiesViewController from after adding a city
     */
    func showCitiesFromAddCity() {
        let vc = navigationController.viewControllers.filter { $0 is CitiesViewController }.first! as! CitiesViewController
        let vm = CitiesViewModel()
        vc.coordinator = self
        vc.viewModel = vm
        navigationController.popToViewController(vc, animated: true)
    }
    /*
     Navigate to the DetailsViewController
     */
    func showDetail(city:SCityWeather) {
        let vc = DetailsViewController()
        let vm = DetailsViewModel(city: city)
        vc.coordinator = self
        vc.viewModel = vm
        navigationController.pushViewController(vc, animated: true)
    }
    /*
     Go back from any ViewController
     */
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
