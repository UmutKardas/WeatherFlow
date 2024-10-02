//
//  String+Extension.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 2.10.2024.
//

import Foundation

extension String {
    func toDayAnd12HourTimeFormat(timezone: Int) -> String? {
        guard let timeInterval = Double(self) else { return nil }

        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE h:mm a"

        dateFormatter.timeZone = TimeZone(secondsFromGMT: timezone)

        return dateFormatter.string(from: date).uppercased()
    }
}
