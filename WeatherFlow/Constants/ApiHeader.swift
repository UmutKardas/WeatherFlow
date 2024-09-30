//
//  ApiHeader.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 1.10.2024.
//
import Alamofire

enum APIHeaders {
    static var defaultHeaders: HTTPHeaders {
        return [
            "x-rapidapi-key": "d058c4112cmsh524a5e93033cb97p1d6558jsn66fa21f157e7",
            "x-rapidapi-host": "open-weather13.p.rapidapi.com"
        ]
    }
}
