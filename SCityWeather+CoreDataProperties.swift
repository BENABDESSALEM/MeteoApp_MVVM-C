//
//  SCityWeather+CoreDataProperties.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/25/23.
//
//

import Foundation
import CoreData


extension SCityWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SCityWeather> {
        return NSFetchRequest<SCityWeather>(entityName: "SCityWeather")
    }

    @NSManaged public var country: String?
    @NSManaged public var name: String?
    @NSManaged public var weather: NSSet?

}

// MARK: Generated accessors for weather
extension SCityWeather {

    @objc(addWeatherObject:)
    @NSManaged public func addToWeather(_ value: SWeatherItem)

    @objc(removeWeatherObject:)
    @NSManaged public func removeFromWeather(_ value: SWeatherItem)

    @objc(addWeather:)
    @NSManaged public func addToWeather(_ values: NSSet)

    @objc(removeWeather:)
    @NSManaged public func removeFromWeather(_ values: NSSet)

}
