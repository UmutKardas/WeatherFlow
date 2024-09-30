//
//  NetworkError.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 1.10.2024.
//

enum NetworkError: Error {
    case fileNotFound
    case invalidURL
    case unknownError(Error)
    case invalidResponse(String)
}
