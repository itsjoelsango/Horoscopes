//
//  HoroscopeData.swift
//  Horoscopes
//
//  Created by Michael on 5/26/25.
//

import SwiftUI

/// Horoscope ViewModel that links The horoscope Model and The View (UI)
@MainActor
class HoroscopeData: ObservableObject {
    @Published var horoscope: Horoscope? = nil
    @Published var horoscopeSign: Horoscope.Sign = .aquarius
    @Published var horoscopesArchivedList: [Horoscope] = [] // Array
    
    init() {
        Task {
            await loadHoroscope()
        }
    }
    
    // Loads horoscope
    func loadHoroscope() async {
        do {
            let horoscope = try await HoroscopeFetchingClient.getHoroscope(sign: horoscopeSign.rawValue)
            self.horoscope = horoscope
            self.horoscopesArchivedList.append(horoscope)
            self.saveHoroscopeHistoryToFile()
        }
        catch {
            print(error)
        }
    }
    
    // Find Index of Horoscope in its list
    func index(of horoscope: Horoscope) -> Int? {
        for i in horoscopesArchivedList.indices {
            if horoscopesArchivedList[i].id == horoscope.id {
                return i
            }
        }
        return nil
    }
    
    // MARK: - Persistence in FileManager
    /// Encodes List of Generated Horoscope into JSON File
    ///  and saves them to URL in the directory
    func saveHoroscopeHistoryToFile() {
        do {
            let encodedData = try JSONEncoder().encode(horoscopesArchivedList)
            try encodedData.write(to: horoscopeHistoryFileURL)
        }
        catch {
            fatalError("An error occurred while saving Horoscopes: \(error)")
        }
    }
    
    func loadHoroscopeArchivedListFromFile() {
        guard let data = try? Data(contentsOf: horoscopeHistoryFileURL) else { return }
        
        do {
            let archivedHoroscope = try JSONDecoder().decode([Horoscope].self, from: data)
            self.horoscopesArchivedList = archivedHoroscope
        }
        catch {
            fatalError("An error occurred while loading Horoscopes: \(error)")
        }
    }
    
    // returns the url where file's stored
    private var horoscopeHistoryFileURL: URL {
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory,
                                                                 in: .userDomainMask,
                                                                 appropriateFor: nil,
                                                                 create: true
            )
            return documentsDirectory.appendingPathComponent("horoscopeArchiveData").appendingPathExtension(for: .json)
        }
        catch {
            fatalError("An error occurred while getting the url: \(error)")
        }
    }
    
}
