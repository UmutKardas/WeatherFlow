//
//  HomeUIView.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 30.09.2024.
//

import SDWebImageSwiftUI
import SwiftUI

struct HomeUIView: View {
    @StateObject var viewModel: HomeViewModel = .init(weatherService: WeatherService())

    var body: some View {
        ZStack {
            Color("\(ColorPath.background(timeOfDay: viewModel.timeOfDay).colorPath)")
                .ignoresSafeArea()
            if viewModel.weather == nil {
                LoadingUIView()
            }
            else {
                VStack(spacing: 30) {
                    // Title
                    VStack {
                        Text(viewModel.weather?.name ?? "")
                            .font(.largeTitle)
                            .foregroundColor(Color("\(ColorPath.text(timeOfDay: viewModel.timeOfDay).colorPath)"))
                        
                        Text(viewModel.weather?.dt.description.toDayAnd12HourTimeFormat(timezone: viewModel.weather?.timezone ?? 0) ?? "")
                            .bold()
                            .font(.callout)
                            .foregroundColor(Color("\(ColorPath.text(timeOfDay: viewModel.timeOfDay).colorPath)"))
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, UIScreen.main.bounds.height / 15)
                    
                    // Body
                    VStack(spacing: UIScreen.main.bounds.height / 15) {
                        ZStack {
                            WebImage(url: URL(string: IconPath.icon(icon: viewModel.weather?.weather.first?.icon ?? "").urlString))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                        }
                        
                        VStack {
                            HStack {
                                Text("\(viewModel.fahrenheitToCelsius(fahrenheit: viewModel.weather?.main.temp ?? 0.0), specifier: "%.0f")°")
                                    .font(.system(size: 65))
                                    .bold()
                                    .foregroundColor(Color("\(ColorPath.text(timeOfDay: viewModel.timeOfDay).colorPath)"))
                                
                                Text("C")
                                    .font(.system(size: 55))
                                    .bold()
                                    .foregroundColor(Color("\(ColorPath.text(timeOfDay: viewModel.timeOfDay).colorPath)"))
                                    .baselineOffset(-10)
                            }
                            
                            Text(viewModel.weather?.weather.first?.description ?? "")
                                .font(.headline)
                                .foregroundColor(Color("\(ColorPath.secondaryText(timeOfDay: viewModel.timeOfDay).colorPath)"))
                                .opacity(0.7)
                        }
                    }
                    
                    // Bottom
                    VStack {
                        HomeCustomDivider(widthValue: 40, heightValue: 2)
                        Spacer()
                        
                        HStack(spacing: 25) {
                            HomeBottomItem(imageName: "sun.horizon", title: "SUNRISE", description: viewModel.weather?.sys.sunrise.toTimeFromUnixTimestamp(timezone: viewModel.weather?.timezone ?? 0) ?? "", timeOfDay: viewModel.timeOfDay)
                            HomeCustomDivider(widthValue: 2, heightValue: 40)
                            HomeBottomItem(imageName: "thermometer.variable", title: "WIND", description: viewModel.weather?.wind.speed.toWindSpeedString() ?? "", timeOfDay: viewModel.timeOfDay)
                            HomeCustomDivider(widthValue: 2, heightValue: 40)
                            HomeBottomItem(imageName: "humidity.fill", title: "TEMPERATURE",
                                           description: "\(String(format: "%.1f", (viewModel.fahrenheitToCelsius(fahrenheit: viewModel.weather?.main.temp ?? 0.0) * 10) / 10))°",
                                           timeOfDay: viewModel.timeOfDay)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, UIScreen.main.bounds.height / 40)
                }
            }
        }
    }
}

#Preview {
    HomeUIView()
}
