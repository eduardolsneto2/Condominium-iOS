//
//  APIConstants.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Foundation

struct ServerConstants {
    
    struct ProductionServer {
        static let basePostURL = "http://localhost:5005/v1"
        static let baseChatURL = "http://localhost:3000/V1"
    }
}

enum HTTPHeaderField: String {
    case authentication = "authorization"
}
