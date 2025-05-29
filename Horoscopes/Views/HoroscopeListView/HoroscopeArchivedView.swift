//
//  HoroscopeArchivedView.swift
//  Horoscopes
//
//  Created by Michael on 5/28/25.
//

import SwiftUI

struct HoroscopeArchivedView: View {
    @EnvironmentObject private var horoscopeData: HoroscopeData
    
    var body: some View {
        NavigationStack {
            horoscopeRow
        }
    }
    
    private var horoscopeRow: some View {
        List(horoscopes.sorted(by: >), id: \.id) { horoscope in
            NavigationLink(destination: {
                HoroscopeDetailView(horoscope: binding(for: horoscope))
            }, label: {
                VStack(alignment: .listRowSeparatorLeading, spacing: 8) {
                    Text("\(horoscope.timestamp)")
                    HStack {
                        Text(horoscope.name).bold()
                        Text(horoscope.icon)
                    }
                }
                .swipeActions {
                    Button(role: .destructive) {
                        withAnimation(.default) {
                            horoscopeData.horoscopesArchivedList.removeAll(where: { $0.id == horoscope.id })
                        }
                    } label: {
                        Label("Remove", systemImage: "trash")
                    }
                }
            })
        }
        .navigationTitle("Recents")
        .onDisappear {
            horoscopeData.saveHoroscopeHistoryToFile()
        }
    }
}

extension HoroscopeArchivedView {
    private var horoscopes: [Horoscope] {
        horoscopeData.horoscopesArchivedList
    }
    
    func binding(for horoscope: Horoscope) -> Binding<Horoscope> {
        guard let index = horoscopeData.index(of: horoscope) else {
            fatalError("Horoscope not found!")
        }
        return $horoscopeData.horoscopesArchivedList[index]
    }
}

#Preview {
    HoroscopeArchivedView()
        .environmentObject(HoroscopeData())
}
