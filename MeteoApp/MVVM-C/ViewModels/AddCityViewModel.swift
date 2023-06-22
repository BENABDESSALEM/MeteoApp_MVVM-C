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
    let kKelvinZeroInCelsius = 273.15
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
        guard let text = searchText else { return }
        let searchedCity = text.addingPercentEncoding(
            withAllowedCharacters: .urlHostAllowed
        ) ?? ""
        self.isLoadingEnabled.value = true
        self.isCityAdded.value = false
        meteoApi.getCityByName(name: searchedCity) { result in
            self.isLoadingEnabled.value = false
            switch result {
            case .success(let weather):
                self.setupAddedCity(city: searchedCity, weather:weather)
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
    func setupAddedCity(city:String,weather:Weather) {
        let temp = "\(self.toCelsius(kelvin: (weather.main?.temp) ?? 15))"
        let temp_min = "\(self.toCelsius(kelvin: (weather.main?.tempMin) ?? 15))"
        let temp_max = "\(self.toCelsius(kelvin: (weather.main?.tempMax) ?? 15))"
        let name = (weather.name ?? "") + ", " + (weather.sys?.country ?? "")
        let tempMinMax = "H\(temp_max)°, L\(temp_min)°"
        let status = weather.weather?.first?.description
        let image = weather.weather?.first?.icon
        let cityWeather = CityWeather(temp: temp, tempMinMax: tempMinMax, city: name, status: status, image: image)
        self.isCityAdded.value = true
        self.results.value.append(cityWeather)
    }
    /*
     Converting the tempereture value to Celsius.
     */
    func toCelsius(kelvin: Double) -> Int {
        return Int(kelvin - kKelvinZeroInCelsius)
    }
    /*
     Check the minimuim number of characters to start the search.
     */
    func isCharactersReached() -> Bool {
        guard let searchText = searchText else { return false }
        return searchText.count >= 3
    }
}
