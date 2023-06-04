//
//  NewsListViewModel.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import Foundation
import NetworkInterface

class NewsListViewModel: BaseViewModel {
    private let pageSize: Int = 20
    private var page = 1
    private var query = "India"
    
    var news = [Article]()
    
    func loadNews(query: String = "India") {
        self.query = query
        let servcie = NewsService.getNewsList(query: query, page: page, pageSize: pageSize)
        self.startMakingRequest()
        servcie.sink { status in
            self.finishLoadingRequest()
            switch status {
            case .failure(let err):
                print(err.localizedDescription)
                
            case .finished:
                break
            }
        } receiveValue: { result in
            if result.status == "error" {
                App.showAlert(withTitle: "Title", message: result.message)
                return
            }
            if self.page == 1 {
                self.news = result.articles ?? []
            } else {
                self.news.append(contentsOf: result.articles ?? [])
            }
        }.store(in: &cancellables)
    }
    
    func loadNextPage() {
        page += 1
        loadNews()
    }
    
    func searchNews(query: String) {
        page = 1
        loadNews(query: query)
    }
}
