//
//  ApiProtocol.swift
//
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import Foundation

//MARK: ApiProtocol.

protocol ApiProtocol {
    var key: String {get}
    var apiUrl: String {get}
    var version: String {get}
    var urlSession: URLSessionProtocol {get}
    var defaultParameters: [URLQueryItem] {get}
    
    func getEndpoint() -> String
}

//MARK: URLSessionProtocol.

public typealias DataTaskResult = @Sendable (Data?, URLResponse?, Error?) -> Void

public protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }
