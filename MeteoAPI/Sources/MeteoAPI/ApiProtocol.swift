//
//  ApiProtocol.swift
//
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

//MARK: ApiProtocol.

/*
   Defining the variables an the method the we will use as blueprint.
 */
protocol ApiProtocol {
    var key: String {get}
    var apiUrl: String {get}
    var version: String {get}
    var urlSession: URLSessionProtocol {get}
    var defaultParameters: [URLQueryItem] {get}
    
    func getEndpoint() -> String
}

//MARK: URLSessionProtocol.
/*
   The completion result type.
 */
public typealias DataTaskResult = @Sendable (Data?, URLResponse?, Error?) -> Void
/*
   DataTask protocol.
 */
public protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }
