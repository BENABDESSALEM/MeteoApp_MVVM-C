//
//  DetailsViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/24/23.
//

import Foundation

final class DetailsViewModel {
    
    let cityName: Bindable<String?> = Bindable(nil)
    let temp: Bindable<String?> = Bindable(nil)
    let description: Bindable<String?> = Bindable(nil)
    let averageTemp: Bindable<String?> = Bindable(nil)
    let windSpeed: Bindable<String?> = Bindable(nil)
    let weatherImage: Bindable<String?> = Bindable(nil)
    let city:CityWeather!
    
    var list:[WeatherItem] = []
    
    var weather:WeatherItem? {
        didSet {
            cityName.value = city.city
            temp.value = weather?.temp
            description.value = weather?.description
            averageTemp.value = weather?.tempMinMax
            weatherImage.value = weather?.image
            windSpeed.value = weather?.windSpeed
        }
    }

    init(city: CityWeather!) {
        self.city = city
        self.list = city.list ?? []
        getTodayWeather()
    }
    
    func getTodayWeather() {
        let calendar = Calendar.current
        weather = list.filter({calendar.isDateInToday($0.date!)}).first
    }
}
