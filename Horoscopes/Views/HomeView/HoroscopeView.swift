//
//  HoroscopeView.swift
//  Horoscopes
//
//  Created by Michael on 5/25/25.
//

import SwiftUI

struct HoroscopeView: View {
    @EnvironmentObject private var horoscopeData: HoroscopeData
    @State private var isButtonDisabled = false
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            VStack {
                selectedHoroscopePickerView
                if horoscopeData.horoscope != nil {
                    if isLoading {
                        VStack(alignment: .center) {
                            Spacer()
                            ProgressView()
                                .padding()
                            Spacer()
                        }
                    } else {
                        HoroscopeCardView(horoscope: Binding(
                            get: { horoscopeData.horoscope! },
                            set: { horoscopeData.horoscope = $0 }
                        ))
                    }
                }
                
                Spacer()
                Button(action: {
                    Task {
                        isButtonDisabled = true
                        isLoading = true
                        await horoscopeData.loadHoroscope()
                        // Wait for 6 seconds before re-enabling the button
                        isLoading = false
                        try? await Task.sleep(nanoseconds: 6_000_000_000) // 6 seconds delay
                        isButtonDisabled = false
                    }
                }, label: {
                    HStack {
                        Spacer()
                        Label("Get New Horoscope", systemImage: "flame")
                            .foregroundStyle(.background, .primary, .secondary)
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.red))
                })
                .disabled(isButtonDisabled)
                .opacity(isButtonDisabled ? 0.1 : 1.0)
  
            }
            .padding(.horizontal)
            .padding(.bottom)
            .navigationTitle("Horoscope")
            .scrollIndicators(.hidden)
        }
    }
    
    private var selectedHoroscopePickerView: some View {
        Picker("Horoscope Selection", selection: $horoscopeData.horoscopeSign) {
            ForEach(Horoscope.Sign.allCases, id: \.rawValue) { sign in
                Text(sign.rawValue).tag(sign)
            }
        }
        .pickerStyle(.inline)
    }
}

/// CardView to display a single Horoscope
private struct HoroscopeCardView: View {
    @Binding var horoscope: Horoscope
    
    var body: some View {
        VStack {
            Text(horoscope.name)
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
            Text(horoscope.dates)
            Text(horoscope.icon)
                .font(.system(.largeTitle, design: .rounded, weight: .regular))
            Text("“\(horoscope.prediction)“")
                .italic()
        }
    }
}

#Preview {
    HoroscopeView()
        .environmentObject(HoroscopeData())
}
