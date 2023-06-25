//
//  WeatherResponse.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/24/23.
//

import Foundation

// MARK: - WeatherResponse
public struct WeatherResponse: Codable {
    let list: [List]
    let city: City
}

// MARK: - City
public struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
}

// MARK: - List
public struct List: Codable {
    let main: Main
    let weather: [WeatherDetails]
    let wind: Wind
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case main, weather, wind
        case dtTxt = "dt_txt"
    }
}
// MARK: - Description
enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

// MARK: - Extension of WeatherResponse.

extension WeatherResponse {
    var name:String {
        return self.city.name
    }
    var country:String{
        return self.city.country
    }
}

// MARK: - Extension of List.

extension List {
    var image:String {
        return self.weather.first?.icon ?? "02d"
    }
    var temp:String {
        return "\(self.toCelsius(kelvin: self.main.temp))"
    }
    var temp_min:String {
        return "\(self.toCelsius(kelvin: self.main.tempMin))"
    }
    var temp_max:String {
        return "\(self.toCelsius(kelvin: self.main.tempMax))"
    }
    var status:String {
        return self.weather.first?.description ?? ""
    }
    var tempMinMax:String {
        return "H\(temp_max)°, L\(temp_min)°"
    }
    var windSpeed:String {
        return "\(self.wind.speed) m/s"
    }
    var date: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: self.dtTxt)!
    }
    func toCelsius(kelvin: Double) -> Int {
        return Int(kelvin - 273.15)
    }
}
