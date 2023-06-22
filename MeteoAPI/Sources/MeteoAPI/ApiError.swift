import Foundation

/// Define your custom errors
enum ApiError: Error {
    case invalidData
    case cityNotFound
}

extension ApiError {
    var description: String {
        switch self {
        case .invalidData:
            return "Invalid Data"
        case .cityNotFound:
            return "City not found"
        }
    }
}
