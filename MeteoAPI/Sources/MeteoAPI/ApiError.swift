//
//  ApiResult.swift
//
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

/// Define your custom errors
enum ApiError: Error {
    case invalidData
}

extension ApiError {
    var description: String {
        switch self {
        case .invalidData:
            return "Invalid Path"
        }
    }
}
