//
//  Constants.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

// MARK: - Weather
struct WeatherDetails: Codable {
    let id: Int
    let main: MainEnum
    let description: String
    let icon: String
}
