//
//  Int+Extension.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 2.10.2024.
//

import Foundation

extension Int {
    func toTimeFromUnixTimestamp(timezone: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        dateFormatter.timeZone = TimeZone(secondsFromGMT: timezone)

        return dateFormatter.string(from: date)
    }
}
