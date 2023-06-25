//
//  CityResponse.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

// MARK: - CityResponse

public struct CityResponse: Codable {
    public let id: Int
    public let name: String?
    public let coord: Coord?
}

// MARK: - Extension of CityResponse

extension CityResponse {
    var lat:String {
        return "\(self.coord?.lat ?? 0)"
    }
    var lon:String {
        return "\(self.coord?.lon ?? 0)"
    }
}
