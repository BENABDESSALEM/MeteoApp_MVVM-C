//
//  CityCellViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/21/23.
//

import Foundation

final class CityCellViewModel {
    // MARK: - Constants.
    let temperature: Bindable<String?> = Bindable("")
    let tempMinMax: Bindable<String?> = Bindable("")
    let cityName: Bindable<String?> = Bindable("")
    let status: Bindable<String?> = Bindable("")
    let pictoImage: Bindable<String?> = Bindable("")
    
    init(city:CityWeather) {
        temperature.value = city.temp
        tempMinMax.value = city.tempMinMax
        cityName.value = city.city
        status.value = city.status
        pictoImage.value = city.image
    }
}
