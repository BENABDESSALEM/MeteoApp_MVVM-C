//
//  CitiesViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/24/23.
//

import Foundation

final class CitiesViewModel {
    
    // MARK: - Bindable Constants.
    let citiesList: Bindable<[CityWeather]> = Bindable([])
    let showList: Bindable<Bool> = Bindable(false)

    // MARK: Initialisation.
    init() {
        checkData()
    }
    /*
     Check if the list is empty we will hide the message indicated that there is no data yet.
     */
    func checkData() {
        showList.value = citiesList.value.count != 0
    }
}
