//
//  HoroscopesTests.swift
//  HoroscopesTests
//
//  Created by Michael on 5/25/25.
//

import Foundation
import Testing
@testable import Horoscopes

struct HoroscopesTests {
    
    @Test func testJSONDecoderDecodesHoroscope() throws {
        let decode = JSONDecoder()
        decode.dateDecodingStrategy = .secondsSince1970
        let horoscope = try decode.decode(Horoscope.self, from: testFeature_)
        #expect(horoscope.name == "Cancer")
        
        let expectedSeconds = TimeInterval(1748200696)
        let expectedTime = Date(timeIntervalSince1970: expectedSeconds)
        #expect(horoscope.timestamp == expectedTime)
    }
    
    @Test func textJSONDecoderDecodesMultipleHoroscopes() throws {
        let decode = JSONDecoder()
        decode.dateDecodingStrategy = .secondsSince1970
        let result = try decode.decode(HoroscopeResultJSON.self, from: testResponse_horoscopes)
        #expect(result.results.count == 6)
    }
}
