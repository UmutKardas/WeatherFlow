//
//  IconPath.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 2.10.2024.
//

enum IconPath {
    case icon(icon: String)

    var urlString: String {
        switch self {
        case .icon(let icon):
            "https://openweather.site/img/wn/\(icon).png"
        }
    }
}
