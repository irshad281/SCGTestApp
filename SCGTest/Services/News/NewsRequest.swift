//
//  NewsRequest.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import Foundation
import NetworkInterface

enum NewsRequest: Request {
    case list(query: String, page: Int, pageSize: Int)
    
    var method: HTTPMethod { .get }
    
    var baseURLString: String {App.configuration.baseURL }
    
    var endPoint: String {
        switch self {
        case .list(let query, let page, let pageSize):
            return "v2/everything?q=\(query)&apiKey=\(App.configuration.apiKey)&page=\(page)&pageSize=\(pageSize)&sortBy=publishedAt"
        }
    }
    
    func body() throws -> Data? { nil }
    
    func headers() -> [String : String] { [:] }
}
