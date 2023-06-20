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
