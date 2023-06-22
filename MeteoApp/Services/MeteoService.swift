//
//  MeteoService.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation
import MeteoAPI

public class MeteoService {
    
    let meteoService = APIManager(key: API_Key,apiUrl: API_BASE_URL,version: API_Version)
    
    public func getCityByName(name: String,completion: @escaping (ApiResult<Weather>) -> Void) {
        meteoService.send(to: "weather", with: ["q": name], completion: completion)
    }
    
    public func getWeatherForLocation(latitude: String, longitude: String, completion: @escaping (ApiResult<Weather>) -> Void) {
        meteoService.send(to: "weather", with: ["lat": latitude, "lon": longitude], completion: completion)
    }
}
