//
//  Constants.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

public struct WeatherDetails: Codable {
    public let id: Int?
    public let main: String?
    public let description: String?
    public let icon: String?
}
