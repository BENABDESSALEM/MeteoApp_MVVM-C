//
//  SWeather+CoreDataProperties.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/25/23.
//
//

import Foundation
import CoreData


extension SWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SWeather> {
        return NSFetchRequest<SWeather>(entityName: "SWeather")
    }

    @NSManaged public var temp: String?
    @NSManaged public var desc: String?
    @NSManaged public var average: String?
    @NSManaged public var image: String?
    @NSManaged public var windSpeed: String?
    @NSManaged public var date: Date?
    @NSManaged public var city: SCity?

}
