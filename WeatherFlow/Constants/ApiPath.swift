//
//  ApiPath.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 1.10.2024.
//

enum ApiPath {
    case weatherByCity(city: String, language: String)
    case weatherByLatLon(lat: Double, lon: Double)
    case fiveDaysForecast(lat: Double, lon: Double)

    var urlString: String {
        switch self {
        case .weatherByCity(let city, let language):
            return "https://open-weather13.p.rapidapi.com/city/\(city)/\(language)"
        case .weatherByLatLon(let lat, let lon):
            return "https://open-weather13.p.rapidapi.com/city/latlon/\(lat)/\(lon)"
        case .fiveDaysForecast(let lat, let lon):
            return "https://open-weather13.p.rapidapi.com/city/fivedaysforcast/\(lat)/\(lon)"
        }
    }
}
