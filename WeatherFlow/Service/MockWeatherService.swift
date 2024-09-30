//
//  MockWeatherService.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 1.10.2024.
//

import Foundation

class MockWeatherService: IWeatherService {
    func fetchWeather(path: ApiPath, completion: @escaping (Result<Weather, NetworkError>) -> Void) {
        guard let mockWeatherFilePath = Bundle.main.path(forResource: "weatherMock", ofType: "json") else {
            completion(.failure(.fileNotFound))
            return
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: mockWeatherFilePath))
            let weather = try JSONDecoder().decode(Weather.self, from: data)
            completion(.success(weather))
        } catch {
            completion(.failure(.unknownError(error)))
        }
    }
}
