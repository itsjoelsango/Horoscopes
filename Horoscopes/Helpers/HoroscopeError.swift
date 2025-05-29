//
//  HoroscopeError.swift
//  Horoscopes
//
//  Created by Michael on 5/25/25.
//

import Foundation

enum HoroscopeError: Error {
    case missingData
}

extension HoroscopeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discard a HoroScope missing a valid date, name, sign or prediction", comment: "")
        }
    }
}
