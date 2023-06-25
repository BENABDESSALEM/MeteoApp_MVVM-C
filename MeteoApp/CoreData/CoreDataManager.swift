//
//  CoreDataManager.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/25/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "MeteoApp")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }

    func save() {
        do {
            try context.save()
        } catch let error {
            print("Error saving Core Data. \(error)")
        }
    }
    
    func city(name: String, country: String) -> SCity {
      let city = SCity(context: container.viewContext)
      city.name = name
      city.country = country
      return city
    }
    
    func cityWeather(temp: String, average: String, desc:String, image:String, windSpeed:String, date: Date, city: SCity) -> SWeather {
      let weather = SWeather(context: container.viewContext)
      weather.temp = temp
      weather.average = average
      weather.image = image
      weather.desc = desc
      weather.windSpeed = windSpeed
      city.addToWeather(weather)
      return weather
    }
    
    func getCities() -> [SCity] {
      let request: NSFetchRequest<SCity> = SCity.fetchRequest()
      var fetchedCities: [SCity] = []
      do {
          fetchedCities = try container.viewContext.fetch(request)
      } catch let error {
         print("Error fetching singers \(error)")
      }
      return fetchedCities
    }
}
