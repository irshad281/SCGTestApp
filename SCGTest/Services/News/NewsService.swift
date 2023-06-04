//
//  NewsService.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import Foundation
import NetworkInterface

struct NewsService {
    static func getNewsList(query: String, page: Int, pageSize: Int) -> Response<NewsList> {
        NetworkInterface.performRequest(NewsRequest.list(query: query, page: page, pageSize: pageSize))
    }
}
