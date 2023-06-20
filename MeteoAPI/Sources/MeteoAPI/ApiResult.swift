//
//  ApiResult.swift
//  
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation
/**
 All query output are wrapped into this Enum
 */
public enum ApiResult<T> {
    /**
     Success Result
     - Parameter T: T can be Weather of Forecast struct
     */
    case success(T)
    /**
     Error case
     - Parameter Error?: error can be nil when error are unknown
     */
    case error(Error?)
}
