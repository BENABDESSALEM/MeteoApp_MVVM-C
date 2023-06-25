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
    let weatherList: Bindable<[SWeatherItem]> = Bindable([])

    let city:SCityWeather!
    
    // MARK: Variable.
    var list:[SWeatherItem] = []
    
    // MARK: Proprety observer.
    var weather:SWeatherItem? {
        didSet {
            cityName.value = city.name
            temp.value = weather?.temp
            description.value = weather?.description
            averageTemp.value = weather?.average
            weatherImage.value = weather?.image
            windSpeed.value = weather?.windSpeed
        }
    }

    // MARK: Initialisation.
    init(city: SCityWeather!) {
        self.city = city
        self.list = city.weather?.allObjects as! [SWeatherItem]
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
extension NSSet {
  func toArray<T>() -> [T] {
    let array = self.map({ $0 as! T})
    return array
  }
}
