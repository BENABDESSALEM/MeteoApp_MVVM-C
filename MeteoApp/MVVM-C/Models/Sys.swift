//
//  Constants.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

public struct Sys: Codable {
    public let id: Int?
    public let type: Int?
    public let message: Double?
    public let country: String?
    public let sunrise: Int?
    public let sunset: Int?
}
