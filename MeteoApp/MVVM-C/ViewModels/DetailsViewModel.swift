//
//  DetailsViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/24/23.
//

import Foundation

final class DetailsViewModel {
    
    // MARK: - Bindable Constants.
    let cityName: Bindable<String?> = Bindable(nil)
    let temp: Bindable<String?> = Bindable(nil)
    let description: Bindable<String?> = Bindable(nil)
    let averageTemp: Bindable<String?> = Bindable(nil)
    let windSpeed: Bindable<String?> = Bindable(nil)
    let weatherImage: Bindable<String?> = Bindable(nil)
    let weatherList: Bindable<[WeatherItem]> = Bindable([])

    let city:CityWeather!
    
    // MARK: Variable.
    var list:[WeatherItem] = []
    
    // MARK: Proprety observer.
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

    // MARK: Initialisation.
    init(city: CityWeather!) {
        self.city = city
        self.list = city.list ?? []
        self.weatherList.value = self.list
        getTodayWeather()
    }
    /*
           Note: The request related to get the weather by coordinate of the city,as response will include just the five days of the week except Saturday and Sunday
          - So if the day is Saturday or Sunday, we will fill the page details by the first element of the response 
     */
    func getTodayWeather() {
        let calendar = Calendar.current
        if let weatherDay = list.filter({calendar.isDateInToday($0.date!)}).first {
            weather = weatherDay
        } else {
            weather = list.first
        }
    }
}
