//
//  ColorPath.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 2.10.2024.
//

enum ColorPath {
    case background(timeOfDay: TimeOfDay)
    case secondaryText(timeOfDay: TimeOfDay)
    case text(timeOfDay: TimeOfDay)

    var colorPath: String {
        switch self {
        case .background(let timeOfDay):
            return "background\(timeOfDay.rawValue)"
        case .secondaryText(let timeOfDay):
            return "secondaryText\(timeOfDay.rawValue)"
        case .text(let timeOfDay):
            return "text\(timeOfDay.rawValue)"
        }
    }
}
