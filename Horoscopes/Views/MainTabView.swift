//
//  MainTabView.swift
//  Horoscopes
//
//  Created by Michael on 5/28/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var horoscopeData = HoroscopeData()
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HoroscopeView()
            }
            
            Tab("History", systemImage: "clock") {
                HoroscopeArchivedView()
            }
            
            Tab("About", systemImage: "info") {
                AboutHoroscopeApp()
            }
        }
        .environmentObject(horoscopeData)
        .tint(Color.primary.opacity(0.5).gradient)
        .onAppear {
            horoscopeData.loadHoroscopeArchivedListFromFile()
        }
    }
}

#Preview {
    MainTabView()
}
