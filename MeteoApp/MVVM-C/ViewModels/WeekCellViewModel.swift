//
//  WeekCellViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/24/23.
//

import Foundation

final class WeekCellViewModel {
    
    // MARK: - Bindable Constants.
    let dayName: Bindable<String?> = Bindable("")
    let temp: Bindable<String?> = Bindable("")
    let weatherImage: Bindable<String?> = Bindable("")
    
    // MARK: Initialisation.
    init(item:SWeatherItem) {
        let formatter = DateFormatter()
        formatter.dateFormat  = "EE"
        formatter.locale = Locale(identifier: "en_US")
        let day = formatter.string(from: item.date!)
        dayName.value = day
        temp.value = item.temp
        weatherImage.value = item.image
    }
}
