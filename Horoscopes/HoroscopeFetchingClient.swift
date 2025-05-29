//
//  HoroscopeFetchingClient.swift
//  Horoscopes
//
//  Created by Michael on 5/26/25.
//

import Foundation

struct HoroscopeFetchingClient {
    private enum Endpoint {
        case randomHoroscope(sign: String)
        
        var url: URL {
            URL(string: self.stringValue)!
        }
        
        var stringValue: String {
            switch self {
            case .randomHoroscope(let horoscopeSign):
                "https://api.viewbits.com/v1/horoscope?sign=\(horoscopeSign)"
            }
        }
    }
    
    private static var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .secondsSince1970
        return aDecoder
    }()
    
    static func getHoroscope(sign: String) async throws -> Horoscope {
        let randomHoroscopeEndpoint = Endpoint.randomHoroscope(sign: sign).url
        async let (data, _) = URLSession.shared.data(from: randomHoroscopeEndpoint)
        let response = try await decoder.decode(Horoscope.self, from: data)
        return response
    }
}

