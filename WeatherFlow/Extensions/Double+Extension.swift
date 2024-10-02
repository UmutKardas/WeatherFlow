//
//  Double+Extension.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 2.10.2024.
//

import Foundation

extension Double {
    func toWindSpeedString() -> String {
        return String(format: "%.0fm/s", self)
    }
}
