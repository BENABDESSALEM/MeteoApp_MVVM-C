//
//  SCity+CoreDataProperties.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/25/23.
//
//

import Foundation
import CoreData


extension SCity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SCity> {
        return NSFetchRequest<SCity>(entityName: "SCity")
    }

    @NSManaged public var name: String?
    @NSManaged public var country: String?
    @NSManaged public var weather: NSSet?

}

// MARK: Generated accessors for weather
extension SCity {

    @objc(addWeatherObject:)
    @NSManaged public func addToWeather(_ value: SWeather)

    @objc(removeWeatherObject:)
    @NSManaged public func removeFromWeather(_ value: SWeather)

    @objc(addWeather:)
    @NSManaged public func addToWeather(_ values: NSSet)

    @objc(removeWeather:)
    @NSManaged public func removeFromWeather(_ values: NSSet)

}
