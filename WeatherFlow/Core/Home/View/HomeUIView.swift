//
//  HomeUIView.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 30.09.2024.
//

import SwiftUI

struct HomeUIView: View {
    @StateObject var viewModel: HomeViewModel = .init(weatherService: MockWeatherService())

    var body: some View {
        Text(viewModel.weather?.name ?? "Loading...")
    }
}

#Preview {
    HomeUIView()
}
