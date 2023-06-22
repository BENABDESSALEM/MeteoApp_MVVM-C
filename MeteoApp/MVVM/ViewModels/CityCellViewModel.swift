//
//  CityCellViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/21/23.
//

import Foundation

final class CityViewModel {
    
}

final class CityCellViewModel {
    // MARK: - Constants.
    let cityName: Bindable<String?> = Bindable("")
    let pictoImage: Bindable<String?> = Bindable("")
    
    init(city:CityWeather) {
        cityName.value = city.city
        pictoImage.value = city.image
    }
}
