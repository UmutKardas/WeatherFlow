//
//  HomeViewModel.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 1.10.2024.
//
import SwiftUI

final class HomeViewModel: ObservableObject {
    init(weatherService: IWeatherService) {
        self.weatherService = weatherService
        fetchWeather()
    }

    @Published var weather: Weather?

    private let weatherService: IWeatherService

    private func fetchWeather() {
        weatherService.fetchWeather(path: ApiPath.weatherByCity(city: "istanbul", language: "TR")) { [weak self] result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self?.weather = weather
                }
            case .failure(let error):
                print("Failed to fetch weather: \(error.localizedDescription)")
            }
        }
    }
}
