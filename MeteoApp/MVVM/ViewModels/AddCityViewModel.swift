//
//  AddCityViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation
import MeteoAPI

class AddCityViewModel {
    // MARK:- Constants.
    let results: Bindable<[Weather]> = Bindable([])
    let error: Bindable<String?> = Bindable(nil)
    let isButtonEnabled: Bindable<Bool> = Bindable(false)
    let isLoadingEnabled: Bindable<Bool> = Bindable(false)
    let meteoApi: MeteoService!
    // MARK:- Proprety observer.
    var searchText: String? = "" {
        didSet {
            isButtonEnabled.value = isCharactersReached()
        }
    }
    // MARK:- Init.
    init(apiService:MeteoService) {
        self.meteoApi = apiService
    }
    // MARK: SearchAction
    func searchCity() {
        guard let text = searchText else { return }
        let search = text.addingPercentEncoding(
            withAllowedCharacters: .urlHostAllowed
        ) ?? ""
        self.isLoadingEnabled.value = true
        meteoApi.getCityByName(name: search, limit: 5) { result in
            self.isLoadingEnabled.value = false
            switch result {
            case .success(let weather):
                self.results.value = [weather]
            case .error(_):
                self.error.value = "*** ERROR ***"
            }
        }
    }
    
    func getSearchResultVM(at index: Int) -> SearchResultViewModel {
        let item = results.value[index]
        return SearchResultViewModel(searchResult: item)
    }
    
    func isCharactersReached() -> Bool {
        guard let searchText = searchText else { return false }
        return searchText.count >= 3
    }
}
