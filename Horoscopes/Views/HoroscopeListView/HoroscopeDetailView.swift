//
//  HoroscopeDetailView.swift
//  Horoscopes
//
//  Created by Michael on 5/28/25.
//

import SwiftUI

struct HoroscopeDetailView: View {
//    @EnvironmentObject private var horoscopeData: HoroscopeData
    @Binding var horoscope: Horoscope
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(horoscope.name)
                Text(horoscope.icon)
            }
            .font(.system(.largeTitle, design: .rounded, weight: .regular))
            
            Text(horoscope.dates)
            Text(horoscope.prediction)
                .multilineTextAlignment(.leading)
                .font(.system(.headline, design: .serif, weight: .regular))
                .italic()
            Text("Generated on \(horoscope.timestamp)")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    let horoscopeData = HoroscopeData()
    HoroscopeDetailView(horoscope: Binding<Horoscope>(
        get: { horoscopeData.horoscopesArchivedList[0]},
        set: {_ in }
    ))
    .environmentObject(HoroscopeData())
}
