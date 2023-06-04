//
//  NewsDetailViewController.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import UIKit
import UtilityPackage

final class NewsDetailViewController: BaseViewController, XibLoadable {
    @IBOutlet private weak var newImageView: UIImageView!
    @IBOutlet private weak var newsTitle: UILabel!
    @IBOutlet private weak var newsDescription: UILabel!
    
    private let article: Article
    
    required init(article: Article) {
        self.article = article
        
        super.init(nibName: Self.ID, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Life Cycle

extension NewsDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        self.title = "News Detail"
        newImageView.loadImage(from: article.urlToImage)
        newsTitle.text = article.title
        newsDescription.attributedText = article.content?.htmlBodyStringWith(font: .systemFont(ofSize: 14), color: .lightGray)
    }
}
