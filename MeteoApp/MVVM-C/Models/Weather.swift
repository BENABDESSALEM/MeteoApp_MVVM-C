//
//  Constants.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

public struct Weather: Codable {
    public let id: Int
    public let visibility: Int?
    public let name: String?
    public let coord: Location?
    public let wind: Wind?
    public let base: String?
    public let dt: Int?
    public let weather: [WeatherDetails]?
    public let sys: Sys?
    public let clouds: Clouds?
    public let main: Main?
}

extension Weather {
 
    var temp:String {
        return "\(self.toCelsius(kelvin: (self.main?.temp) ?? 15))"
    }
    var temp_min:String {
        return "\(self.toCelsius(kelvin: (self.main?.tempMin) ?? 15))"
    }
    var temp_max:String {
        return "\(self.toCelsius(kelvin: (self.main?.tempMax) ?? 15))"
    }
    var customName:String {
        return (self.name ?? "") + ", " + (self.sys?.country ?? "")
    }
    var status:String {
        return self.weather?.first?.description ?? ""
    }
    var tempMinMax:String {
        return "H\(temp_max)°, L\(temp_min)°"
    }
    var image:String {
        return self.weather?.first?.icon ?? "02d"
    }
    
    func toCelsius(kelvin: Double) -> Int {
        return Int(kelvin - 273.15)
    }
}
