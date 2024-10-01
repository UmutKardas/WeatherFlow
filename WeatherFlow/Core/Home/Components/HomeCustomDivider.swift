//
//  HomeCustomDivider.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 1.10.2024.
//
import SwiftUI

struct HomeCustomDivider: View {
    var widthValue: CGFloat
    var heightValue: CGFloat

    var body: some View {
        Rectangle()
            .foregroundColor(Color("secondaryText"))
            .frame(width: widthValue, height: heightValue)
            .opacity(0.5)
    }
}
