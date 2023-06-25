//
//  Constants.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

// MARK: - Main

public struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
