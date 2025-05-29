//
//  AboutHoroscopeApp.swift
//  Horoscopes
//
//  Created by Michael on 5/29/25.
//

import SwiftUI

struct AboutHoroscopeApp: View {
    var body: some View {
        ScrollView {
            ZStack {
                Spacer()
                Image(systemName: "shuffle.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .background(
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                    )
                    .foregroundStyle(.red.gradient)
                Spacer()
            }
            Text("Horoscope")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .padding(.bottom)
            aboutAppDescription
        }
        .scrollIndicators(.hidden)
    }
    
    private var aboutAppDescription: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(String(localized: "About this App"))
                .bold()
                .foregroundStyle(.green)
            Text(String(localized: "Welcome to our Horoscope App, where the stars align to bring you daily inspiration! This app allows you to explore a world of astrology by selecting your zodiac sign and receiving a unique, random quote tailored just for you.\nThe app was born out of a desire to test an online API and transition from traditional networking methods in iOS to the modern async/await approach. This ensures a smooth and efficient user experience, making it easier than ever to connect with the cosmos."))
                .font(.system(.body, design: .rounded, weight: .regular))
            Text(String(localized: "To maintain optimal performance and prevent overloading the API, we've implemented a thoughtful delay between requests, allowing you to enjoy each quote without interruption. Additionally, our app features a file management system that saves your recent searches, enabling you to easily revisit your favorite quotes whenever you wish.\nWe hope you have fun exploring and find inspiration in every quote!"))
                .font(.system(.body, design: .rounded, weight: .regular))
        }
        .multilineTextAlignment(.center)
        
        .padding(.horizontal)
    }
}

#Preview {
    AboutHoroscopeApp()
}
