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
