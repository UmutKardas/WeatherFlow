//
//  IWeatherService.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 1.10.2024.
//

protocol IWeatherService {
    func fetchWeather(path: ApiPath, completion: @escaping (Result<Weather, NetworkError>) -> Void)
}
