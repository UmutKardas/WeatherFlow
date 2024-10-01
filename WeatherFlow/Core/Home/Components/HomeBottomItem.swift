//
//  HomeBottomItem.swift
//  WeatherFlow
//
//  Created by Hüseyin Umut Kardaş on 1.10.2024.
//

import SwiftUI

struct HomeBottomItem: View {
    var imageName: String
    var title: String
    var description: String

    var body: some View {
        HStack(spacing: 25) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .foregroundColor(Color("secondaryText"))

                Text(title)
                    .font(.caption)
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(Color("secondaryText"))

                Text(description)
                    .font(.title)
                    .foregroundColor(Color("secondaryText"))
                    .minimumScaleFactor(0.5)
                    .offset(x: 0, y: -5)
            }
            .frame(maxWidth: UIScreen.main.bounds.width / 5)
        }
    }
}
