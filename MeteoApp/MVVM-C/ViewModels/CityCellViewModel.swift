//
//  CityCellViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/21/23.
//

import Foundation

final class CityCellViewModel {
    
    // MARK: - Bindable Constants.
    let temperature: Bindable<String?> = Bindable("")
    let tempMinMax: Bindable<String?> = Bindable("")
    let cityName: Bindable<String?> = Bindable("")
    let status: Bindable<String?> = Bindable("")
    let imageIndicator: Bindable<String?> = Bindable("")
    let messageIndicator: Bindable<String?> = Bindable("")

    // MARK: Proprety observer.
    var isAddCity:Bool = false {
        didSet {
            messageIndicator.value = isAddCity ? "Add" : "Weather details"
            imageIndicator.value = isAddCity ? "plusIcon" : "chevronsForward"
        }
    }
   
    // MARK: Initialisation.
    init(city:SCityWeather) {
        cityName.value = city.name
    }
}
