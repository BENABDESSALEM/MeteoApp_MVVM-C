import Foundation

public final class APIManager: ApiProtocol {
    /// OpenWeatherMap key
    var key: String
    /// OpenWeatherMap endpoint
    var apiUrl: String
    /// OpenWeatherMap version for API
    var version: String
    /// URLSession used for query
    var urlSession: URLSessionProtocol
    /// defaultParameters added to all query
    var defaultParameters: [URLQueryItem] = []
    /**
     Init kit
     - Parameter key: OpenWeatherMap Key
     - Parameter apiUrl: OpenWeatherMap endpoint
     - Parameter urlSession: URLSession used for query
     */
    public init(key: String,apiUrl:String,version:String,urlSession: URLSessionProtocol) {
        self.key = key
        self.apiUrl = apiUrl
        self.version = version
        self.urlSession = urlSession
        self.defaultParameters.append(URLQueryItem(name: "APPID", value: key))
    }
    /**
     Init kit
     - Parameter key: OpenWeatherMap Key
     */
    public convenience init(key: String,apiUrl: String,version: String) {
        self.init(key: key,apiUrl: apiUrl,version: version, urlSession: URLSession.shared)
    }
    /**
     - Returns: The full endpoint string with endpoint and version
     */
    func getEndpoint() -> String {
        return "\(apiUrl)/data/\(version)/"
    }
    /**
     Add defaultParameter for all query
     */
    func addDefaultParameter(name: String, value: String) {
        defaultParameters.append(URLQueryItem(name: name, value: value))
    }
    /**
     Send request
     */
    public func send<T: Codable>(to endpoint: String, with parameters: [String: Any], completion: @escaping (ApiResult<T>) -> Void) {
        var urlComponents = URLComponents(string: "\(getEndpoint())\(endpoint)")!
        urlComponents.queryItems = defaultParameters
        for (key, value) in parameters {
            urlComponents.queryItems?.append(URLQueryItem(name: key, value: (String(describing: value))))
        }
        print(urlComponents.url!,parameters)
        urlSession.dataTask(with: urlComponents.url!) { data, response, error in
            guard let data = data else {
                completion(ApiResult.error(ApiError.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonObj = try decoder.decode(T.self, from: data)
                completion(ApiResult.success(jsonObj))
            } catch let error {
                completion(ApiResult.error(error))
            }
        }.resume()
    }
}

