//
//  HoroscopeResultJSON.swift
//  Horoscopes
//
//  Created by Michael on 5/26/25.
//

import Foundation

struct HoroscopeResultJSON: Decodable {
    private(set) var results: [Horoscope] = []
    
    private enum CodingKeys: String, CodingKey {
        case results = "data"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var resultsContainer = try container.nestedUnkeyedContainer(forKey: .results)
        
        while !resultsContainer.isAtEnd {
            if let horoscopesResult = try? resultsContainer.decode(Horoscope.self) {
                results.append(horoscopesResult)
            }
        }
    }
    
}
