//
//  AppConfiguration.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import Foundation

// MARK: - AppConfiguration
struct AppConfiguration: Codable {
    var apiKey: String
    var baseURL: String

    enum CodingKeys: String, CodingKey {
        case apiKey = "API_KEY"
        case baseURL = "BASE_URL"
    }
    
    init() {
        let url = Bundle.main.url(forResource: "Configuration", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        self = try! JSONDecoder().decode(AppConfiguration.self, from: data)
    }
}
