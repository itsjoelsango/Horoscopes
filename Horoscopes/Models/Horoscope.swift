//
//  Horoscope.swift
//  Horoscopes
//
//  Created by Michael on 5/25/25.
//

import Foundation

/// Returns an array of Horoscopes as result
struct Response: Decodable {
    let results: [Horoscope]
    
    enum CodingKeys: String, CodingKey {
        case results = "data"
    }
    
}

/// Model used to create Horoscope for Horoscopes app
struct Horoscope {
    let id: String
    let name: String
    let icon: String
    let dates: String
    let prediction: String
    let timestamp: Date
    
}

extension Horoscope: Equatable, Comparable {
    static func ==(lhs: Horoscope, rhs: Horoscope) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.timestamp == rhs.timestamp
    }
    
    static func < (lhs: Horoscope, rhs: Horoscope) -> Bool {
        if lhs.timestamp != rhs.timestamp {
            return lhs.timestamp < rhs.timestamp
        } else {
            return lhs.name < rhs.name
        }
    }
}

// Conform to Hashable protocol in order tp use Horoscope in a set or dictionary
extension Horoscope: Hashable {
    
}

extension Horoscope: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case name
        case icon
        case dates
        case prediction
        case timestamp = "timeStamp"
    }
    
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rowId = UUID().uuidString // Generate a new UUID when decoding
        let rowName = try? values.decode(String.self, forKey: .name)
        let rowIcon = try? values.decode(String.self, forKey: .icon)
        let rowDates = try? values.decode(String.self, forKey: .dates)
        let rowPrediction = try? values.decode(String.self, forKey: .prediction)
        let rowTimeStamp = try? values.decode(Date.self, forKey: .timestamp)
        
        guard let name = rowName,
              let icon = rowIcon,
              let dates = rowDates,
              let prediction = rowPrediction,
              let timestamp = rowTimeStamp
        else {
            throw HoroscopeError.missingData
        }
        self.id = rowId
        self.name = name
        self.icon = icon
        self.dates = dates
        self.prediction = prediction
        self.timestamp = timestamp
    }
    
}

extension Horoscope {
    enum Sign: String, CaseIterable {
        case aries
        case taurus
        case gemini
        case cancer
        case leo
        case virgo
        case libra
        case scorpio
        case sagittarius
        case capricorn
        case aquarius
        case pisces
    }
}
