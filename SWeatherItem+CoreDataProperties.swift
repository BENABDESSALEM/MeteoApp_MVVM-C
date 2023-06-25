//
//  SWeatherItem+CoreDataProperties.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/25/23.
//
//

import Foundation
import CoreData


extension SWeatherItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SWeatherItem> {
        return NSFetchRequest<SWeatherItem>(entityName: "SWeatherItem")
    }

    @NSManaged public var temp: String?
    @NSManaged public var desc: String?
    @NSManaged public var average: String?
    @NSManaged public var image: String?
    @NSManaged public var windSpeed: String?
    @NSManaged public var date: Date?
    @NSManaged public var city: SCityWeather?

}
