//
//  Constants.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

// MARK: - Wind

public struct Wind: Codable {
    public let speed: Double
    public let deg: Double?
    var direction: String? {
        guard let deg = deg else { return nil }
        return Direction(deg: deg).rawValue
    }
}

// MARK: - Enum Direction

enum Direction: String {
    case north = "N"
    case northEast = "NE"
    case east = "E"
    case southEast = "SE"
    case south = "S"
    case southWest = "SW"
    case west = "W"
    case northWest = "NW"
    
    init(deg: Double) {
        if deg < 23 || deg > 337 {
            self = .north
        } else if deg < 68 {
            self = .northEast
        } else if deg < 113 {
            self = .east
        } else if deg < 158 {
            self = .southEast
        } else if deg < 203 {
            self = .south
        } else if deg < 248 {
            self = .southWest
        } else if deg < 293 {
            self = .west
        } else {
            self = .northWest
        }
    }
}
