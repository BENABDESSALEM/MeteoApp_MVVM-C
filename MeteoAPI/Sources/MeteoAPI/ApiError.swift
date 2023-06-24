//
//  ApiResult.swift
//
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

/**
   Define your custom errors , and in our case we limit the errors to :
     - Invalid data
     - City not found.
*/
enum ApiError: Error {
    case invalidData
    case cityNotFound
}

extension ApiError {
    var description: String {
        switch self {
        case .invalidData:
            return "Invalid data"
        case .cityNotFound:
            return "City not found"
        }
    }
}
