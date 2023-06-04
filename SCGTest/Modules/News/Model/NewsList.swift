//
//  NewsList.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import Foundation

// MARK: - NewsList
struct NewsList: Codable {
    var status, code, message: String?
    var totalResults: Int?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    var source: Source?
    var author: String?
    var title, description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: Date?
    var content: String?
}

// MARK: - Source
struct Source: Codable {
    var id: String?
    var name: String?
}
