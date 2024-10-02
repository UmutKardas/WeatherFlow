//
//  LoadingUIView.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 2.10.2024.
//
import ActivityIndicatorView
import SwiftUI

struct LoadingUIView: View {
    var body: some View {
        ActivityIndicatorView(isVisible: .constant(true), type: .default(count: 8))
            .foregroundStyle(.foreground)
            .frame(width: 50.0, height: 50.0)
    }
}
