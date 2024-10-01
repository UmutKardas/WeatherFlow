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
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack(spacing: 30) {
                // Title
                VStack {
                    Text(viewModel.weather?.name ?? "")
                        .font(.largeTitle)

                    Text("MONDAY 7:00 AM")
                        .bold()
                        .font(.callout)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, UIScreen.main.bounds.height / 15)

                // Body
                VStack(spacing: UIScreen.main.bounds.height / 15) {
                    ZStack {
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.orange)
                            .offset(x: -50, y: 0)
                        Image("cloud")
                            .resizable()
                            .frame(width: 180, height: 180)
                            .offset(x: 0, y: 35)
                    }

                    VStack {
                        HStack {
                            Text("\(viewModel.weather?.main.temp ?? 0.0, specifier: "%.0f")°")
                                .font(.system(size: 65))
                                .bold()
                            Text("C")
                                .font(.system(size: 55))
                                .bold()
                                .baselineOffset(-10)
                        }

                        Text("GOOD MORNING")
                            .font(.headline)
                            .foregroundColor(Color("secondaryText"))
                            .opacity(0.7)
                    }
                }

                // Bottom
                VStack {
                    HomeCustomDivider(widthValue: 40, heightValue: 2)
                    Spacer()

                    HStack(spacing: 25) {
                        HomeBottomItem(imageName: "sun.horizon", title: "SUNRISE", description: "7:00")
                        HomeCustomDivider(widthValue: 2, heightValue: 40)
                        HomeBottomItem(imageName: "thermometer.variable", title: "WIND", description: "4m/s")
                        HomeCustomDivider(widthValue: 2, heightValue: 40)
                        HomeBottomItem(imageName: "humidity.fill", title: "TEMPRATURE", description: "23°")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, UIScreen.main.bounds.height / 40)
            }
        }
    }
}

#Preview {
    HomeUIView()
}
