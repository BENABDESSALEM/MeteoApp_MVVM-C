import XCTest
@testable import MeteoAPI

final class MeteoAPITests: XCTestCase {
    func testInit() {
        let meteoApi = APIManager(key: "ApiKey",apiUrl: "https://api.openweathermap.org",version: "2.5")
        XCTAssertEqual("ApiKey", meteoApi.key)
        XCTAssertEqual("2.5", meteoApi.version)
        XCTAssertEqual("https://api.openweathermap.org/data/2.5/", meteoApi.getEndpoint())
    }

    func testGetEndpoint() {
        let meteoApi = APIManager(key: "ApiKey",apiUrl: "https://api.openweathermap.org",version: "2.5")
        XCTAssertEqual("https://api.openweathermap.org/data/2.5/", meteoApi.getEndpoint())
    }

    func testDefaultParametersAddAPPID() {
       let meteoApi = APIManager(key: "ApiKey",apiUrl: "https://api.openweathermap.org",version: "")

        XCTAssertEqual(1, meteoApi.defaultParameters.count)

        let queryItem = meteoApi.defaultParameters.first!
        XCTAssertEqual("APPID", queryItem.name)
        XCTAssertEqual("ApiKey", queryItem.value)
    }

    func testAddDefaultParameter() {
        let meteoApi = APIManager(key: "ApiKey",apiUrl: "https://api.openweathermap.org",version: "")

        XCTAssertEqual(1, meteoApi.defaultParameters.count)

        meteoApi.addDefaultParameter(name: "lang", value: "FR")
        XCTAssertEqual(2, meteoApi.defaultParameters.count)

        let queryItem = meteoApi.defaultParameters.first!
        XCTAssertEqual("APPID", queryItem.name)
        XCTAssertEqual("ApiKey", queryItem.value)

        let secondItem = meteoApi.defaultParameters[1]
        XCTAssertEqual("lang", secondItem.name)
        XCTAssertEqual("FR", secondItem.value)
    }
}
