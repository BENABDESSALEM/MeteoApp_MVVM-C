//
//  AddCityViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation
import MeteoAPI

class AddCityViewModel {
    
    // MARK: Constants.
    let results: Bindable<[CityWeather]> = Bindable([])
    let error: Bindable<String?> = Bindable(nil)
    let isButtonEnabled: Bindable<Bool> = Bindable(false)
    let isLoadingEnabled: Bindable<Bool> = Bindable(false)
    let isCityAdded: Bindable<Bool> = Bindable(false)
    let meteoApi: MeteoService!
    
    // MARK: Proprety observer.
    var searchText: String? = "" {
        didSet {
            isButtonEnabled.value = isCharactersReached()
        }
    }
    
    // MARK: Init.
    init(apiService:MeteoService) {
        self.meteoApi = apiService
    }
    /*
     Call the api service to fetch the weather for the specific city
     */
    func getCityWeather() {
        guard let city = searchText else { return }
        self.isLoadingEnabled.value = true
        self.isCityAdded.value = false
        meteoApi.getCityByName(name: city) { result in
            self.isLoadingEnabled.value = false
            switch result {
            case .success(let weather):
                self.setupAddedCity(weather:weather)
            case .error(_):
                self.error.value = "*** ERROR ***"
            }
        }
    }
}

// MARK: Methods.
extension AddCityViewModel {
    /*
     Setup the displayed list of cities.
     */
    func setupAddedCity(weather:Weather) {
        let cityWeather = CityWeather(temp: weather.temp, tempMinMax: weather.tempMinMax, city: weather.customName, status: weather.status, image: weather.image)
        self.isCityAdded.value = true
        self.results.value = [cityWeather]
    }
    /*
     Check the minimuim number of characters to start the search.
     */
    func isCharactersReached() -> Bool {
        guard let searchText = searchText else { return false }
        return searchText.count >= 3
    }
}
