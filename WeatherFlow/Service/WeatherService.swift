//
//  WeatherService.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 1.10.2024.
//

import Alamofire

class WeatherService: IWeatherService {
    func fetchWeather(path: ApiPath, completion: @escaping (Result<Weather, NetworkError>) -> Void) {
        AF.request(path.urlString, headers: APIHeaders.defaultHeaders)
            .validate()
            .responseDecodable(of: Weather.self) { response in
                switch response.result {
                case .success(let weather):
                    completion(.success(weather))
                case .failure(let error):
                    print("Network request failed with error: \(error)")
                    if let data = response.data {
                        print("Response Data: \(String(data: data, encoding: .utf8) ?? "No Data")")
                    }
                    completion(.failure(.invalidResponse(error.localizedDescription)))
                }
            }
    }
}
