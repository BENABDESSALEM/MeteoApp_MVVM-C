//
//  MockURLSession.swift
//  
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import XCTest

@testable import MeteoAPI

final class MockURLSession: URLSessionProtocol {

    private (set) var lastURL: URL?
    var nextDataTask = DataTask()
    var nextData: Data?
    var nextError: Error?
    var lastMethod: String = "GET"
    var lastBody: Data?

    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
        lastURL = url
        completionHandler(nextData, nil, nextError)
        return nextDataTask
    }

    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
        lastURL = request.url!
        lastMethod = request.httpMethod!
        lastBody = request.httpBody
        completionHandler(nextData, nil, nextError)
        return nextDataTask
    }
}

final class DataTask: URLSessionDataTask {
    var resumeRequest = false
    override func resume() {
        resumeRequest = true
    }
}
