//
//  Weather.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 1.10.2024.
//

import Foundation

struct Weather: Codable {
    let coord: Coord
    let weather: [WeatherElement]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

struct Clouds: Codable {
    let all: Int
}

struct Coord: Codable {
    let lon, lat: Double
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

struct WeatherElement: Codable {
    let id: Int
    let main, description, icon: String
    enum CodingKeys: CodingKey {
        case id
        case main
        case description
        case icon
    }
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?

    enum CodingKeys: String, CodingKey {
        case speed, deg, gust
    }
}
