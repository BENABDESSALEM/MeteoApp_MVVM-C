# MeteoApp

I created an network layer called MeteoAPI is a Swift Package Module written in Swift 5.

### Requirements:
iOS 11.0+

### Sequence diagram of the MeteoAPI module:
![pLHTRzCm57tthxZiXKJj9fwZgbgXPKmgepIT1488MV5jOzMn8_jcesBmsx6JVYJjqFh8IwNZt9vppxdNldR4BLM5OgyenmAXu8HMSlOQqiNNwSJ_ZkOBnjnQwf9RNe3BkJ2FKgzWoPN3VU7aRimS4cXUe2jvXYc6Fv2ne8r6nbYck7DmCIhbp1eocL4Nm1sqC0m64CtwS6EKG3qt8ePozsauX5_00FwiSGC9f6Hz3m7pKjvR](https://github.com/BENABDESSALEM/MeteoApp_MVVM-C/assets/37963224/d090efed-eabf-4cda-8e2e-3a24d2a5cb06)

### Installation:
In order to use the MeteoAPI Swift Package Module , you can integrate the framework into your project manually or by installing it from :
https://github.com/BENABDESSALEM/MeteoAPI

### Code implementation:

#### First:

Import MeteoAPI in your view controller's
```
import MeteoAPI
```

#### Then:

Create a MeteoService.swift File:
```
import MeteoAPI

public class MeteoService {
    
    let meteoService = APIManager(key: API_Key,apiUrl: API_BASE_URL,version: API_Version)
    
    public func getCityByName(name: String,completion: @escaping (ApiResult<CityResponse>) -> Void) {
        meteoService.send(to: "weather", with: ["q": name], completion: completion)
    }
    
    public func getWeatherForLocation(latitude: String, longitude: String, completion: @escaping (ApiResult<WeatherResponse>) -> Void) {
        meteoService.send(to: "forecast", with: ["lat": latitude, "lon": longitude], completion: completion)
    }
}

```
#### Finally:

Create an instance of your MeteoService file.

```
let meteoService = MeteoService()
```
Next you can call the api and get your response as the following example:

```
    /*
     Call the api service to fetch the input city.
     */
    func getCity() {
        guard let city = searchText else { return }
        self.isLoadingEnabled.value = true
        meteoApi.getCityByName(name: city) { result in
            self.isLoadingEnabled.value = false
            switch result {
            case .success(let cityDetails):
                print(cityDetails)
            case .error(_):
                self.error.value = "*** ERROR ***"
            }
        }
    }
```
Next you can call the api and get the weather of the city as the following example:

```
    /*
     Call the api service to fetch the weather city.
     */
    func getCityWeather(lat:String,lon:String) {
        meteoApi.getWeatherForLocation(latitude: lat, longitude: lon) { result in
            switch result {
            case .success(let weather):
                self.setupAddedCity(weather: weather)
            case .error(_):
                self.error.value = "*** ERROR ***"
            }
        }
    }

```
