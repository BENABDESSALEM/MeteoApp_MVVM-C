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
    
    func saveAndUpdateCity(weather:CityWeather) {
        let city: SCityWeather!
        /*
         Before saving the data we will check if the city already exist:
            - IF true : so we will update the model
            - if false: so the city no saved ans is new so we will add it.
         */
        let fetchCity: NSFetchRequest<SCityWeather> = SCityWeather.fetchRequest()
        fetchCity.predicate = NSPredicate(format: "name = %@", (weather.city ?? "") as String)
        let results = try? context.fetch(fetchCity)
        if results?.count == 0 {
           city = SCityWeather(context: context)
        } else {
           city = results?.first
        }
        city.name = weather.city
        city.country = weather.country
        if let list = weather.list {
            for weather in list {
                let weatherItem = SWeatherItem(context: context)
                weatherItem.temp = weather.temp
                weatherItem.average = weather.tempMinMax
                weatherItem.image = weather.image
                weatherItem.desc = weather.description
                weatherItem.windSpeed = weather.windSpeed
                weatherItem.date = weather.date
                city.addToWeather(weatherItem)
            }
        }
        save()
    }
    
    func getCities() -> [SCityWeather] {
      let request: NSFetchRequest<SCityWeather> = SCityWeather.fetchRequest()
      var fetchedCities: [SCityWeather] = []
      do {
          fetchedCities = try context.fetch(request)
      } catch let error {
         print("Error fetching singers \(error)")
      }
      return fetchedCities
    }
}
