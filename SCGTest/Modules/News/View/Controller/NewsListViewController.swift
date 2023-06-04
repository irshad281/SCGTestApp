//
//  NewsListViewController.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import Combine
import NetworkInterface
import UIKit
import UtilityPackage

final class NewsListViewController: BaseViewController, XibLoadable {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchField: UITextField!
    
    private let viewModel: NewsListViewModel
    @Published private var searchText = ""
    
    required init(with viewModel: NewsListViewModel = .init()) {
        self.viewModel = viewModel
        
        super.init(nibName: Self.ID, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - LifeCycle

extension NewsListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        observePublishers()
        viewModel.loadNews()
        
        #warning("Problem-1 testing here")
        print(Probllem.findEqualSumIndex([1, 3, 5, 7, 9]))
        
        #warning("Problem-2 testing here")
        print(Probllem.isPalindrom("Level"))
    }
    
    @IBAction func textDidChange() {
        searchText = searchField.text ?? ""
    }
}

// MARK: - Private Helpers

extension NewsListViewController {
    private func setupView() {
        self.title = "News"
        tableView.register(NewsListTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        searchField.delegate = self
    }
    
    private func observePublishers() {
        viewModel.showLoader.sink { [weak self] showLoader in
            guard let self = self, let shouldShow = showLoader else {
                return
            }
            shouldShow ? self.showLoader() : self.hideLoader()
        }.store(in: &cancellables)
        
        viewModel.refreshView.sink { [weak self] sholdRefresh in
            guard let self = self, sholdRefresh else {
                return
            }
            
            self.refreshView()
        }.store(in: &cancellables)
        
        $searchText .debounce(
            for: .milliseconds(800),
            scheduler: RunLoop.main
        )
        .removeDuplicates()
        .map({ (string) -> String? in
            return string
        })
        .compactMap{ $0 }
        .sink { data in
            print(data)
        } receiveValue: { [self] (text) in
            if !text.isEmpty {
                self.performSearch(text)
            }
        }.store(in: &cancellables)
    }
    
    private func refreshView() {
        tableView.reloadData()
    }
    
    private func performSearch(_ query: String) {
        viewModel.searchNews(query: query)
    }
}

// MARK: - TableView

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NewsListTableViewCell.load(from: tableView, with: viewModel.news[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.news[indexPath.row]
        App.navigate(to: .newDetail(article: article), from: navigationController)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offset = scrollView.contentSize.height - scrollView.contentOffset.y - scrollView.height
        if offset <= 200 && !viewModel.isDataLoading {
            viewModel.loadNextPage()
        }
    }
}

// MARK: - UITextFieldDelegate

extension NewsListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if searchText.isEmpty {
            viewModel.searchNews(query: "India")
        }
        textField.resignFirstResponder()
        return true
    }
}
