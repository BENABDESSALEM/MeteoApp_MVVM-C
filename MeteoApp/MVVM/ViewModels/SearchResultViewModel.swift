//
//  SearchResultViewModel.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

class SearchResultViewModel {
    
    public var searchResult: Weather
    
    init(searchResult: Weather) {
        self.searchResult = searchResult
    }
    
    var trackName: String {
        searchResult.name ?? "---"
    }
    
    var collectionName: String {
        searchResult.name ?? "---"
    }
}
