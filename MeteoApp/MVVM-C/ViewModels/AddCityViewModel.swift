//
//  AddCityViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation
import MeteoAPI

final class AddCityViewModel {
    
    // MARK: Constants.
    let results: Bindable<[CityWeather]> = Bindable([])
    let error: Bindable<String?> = Bindable(nil)
    let isButtonEnabled: Bindable<Bool> = Bindable(false)
    let isLoadingEnabled: Bindable<Bool> = Bindable(false)
    let showAlert: Bindable<Bool> = Bindable(false)
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
     Call the api service to fetch the input city.
     */
    func getCity() {
        guard let city = searchText else { return }
        self.isLoadingEnabled.value = true
        self.showAlert.value = true
        meteoApi.getCityByName(name: city) { result in
            self.isLoadingEnabled.value = false
            switch result {
            case .success(let weather):
               // self.setupAddedCity(weather:weather)
                self.getCityWeather(lat:weather.lat,lon:weather.lon)
            case .error(_):
                self.error.value = "*** ERROR ***"
            }
        }
    }
    /*
     Call the api service to fetch the weather city.
     */
    func getCityWeather(lat:String,lon:String) {
        meteoApi.getWeatherForLocation(latitude: lat, longitude: lon) { result in
            switch result {
            case .success(let weather):
                self.setupAddedCity(weather: weather)
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
    func setupAddedCity(weather:WeatherResponse) {
        self.showAlert.value = false
        let city = weather.city.name
        let country = weather.city.country
        var list:[WeatherItem] = []
        let sortedList = weather.list.sorted { (w1, w2) in
            w1.date.compare(w2.date) == .orderedAscending
        }
        let filteredList = sortedList.filter { $0.dtTxt.contains("12:00:00") }
        for item in filteredList {
            let weatherItem = WeatherItem(temp: item.temp, description: item.status, tempMinMax: item.tempMinMax, image: item.image, windSpeed: item.windSpeed, date: item.date)
            list.append(weatherItem)
        }
        let cityWeather = CityWeather(city: city, country: country, list: list)
        self.results.value = [cityWeather]
    }
    /*
     Check the minimuim number of characters to start the search.
     */
    func isCharactersReached() -> Bool {
        guard let searchText = searchText else { return false }
        return searchText.count >= 3
    }
    
    func getListBy(date:Date) -> [List] {
        let nList:[List] = []
        return nList
    }
}

