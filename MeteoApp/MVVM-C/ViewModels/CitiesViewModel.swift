//
//  CitiesViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/24/23.
//

import Foundation

final class CitiesViewModel {
    
    // MARK: - Constants.

    let citiesList: Bindable<[CityWeather]> = Bindable([])
    let showList: Bindable<Bool> = Bindable(false)

    init() {
        checkData()
    }
    
    func checkData() {
        showList.value = citiesList.value.count != 0
    }
}
