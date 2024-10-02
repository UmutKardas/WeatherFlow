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

    @Published var weather: Weather? {
        didSet {
            timeOfDay = getTimeOfDay(using: weather)
        }
    }

    @Published var timeOfDay: TimeOfDay = .Morning

    private let weatherService: IWeatherService

    private func fetchWeather() {
        weatherService.fetchWeather(path: ApiPath.weatherByCity(city: "Sydney", language: "EN")) { [weak self] result in
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

    private func getTimeOfDay(using weather: Weather?) -> TimeOfDay {
        let date = Date(timeIntervalSince1970: TimeInterval(weather?.dt ?? 0))

        guard let timezoneOffset = weather?.timezone,
              let timeZone = TimeZone(secondsFromGMT: timezoneOffset)
        else {
            return .Night
        }

        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents(in: timeZone, from: date)
        let hour = dateComponents.hour ?? 0

        return (hour >= 5 && hour < 22) ? .Morning : .Night
    }

    func fahrenheitToCelsius(fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * (5.0 / 9.0)
    }
}
