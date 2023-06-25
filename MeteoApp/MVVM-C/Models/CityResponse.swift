//
//  City.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

public struct City: Codable {
    public let id: Int
    public let name: String?
    public let coord: Location?
}

extension City {
    var lat:String {
        return "\(self.coord?.lat ?? 0)"
    }
    var lon:String {
        return "\(self.coord?.lon ?? 0)"
    }
}
