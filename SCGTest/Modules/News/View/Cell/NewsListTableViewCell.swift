//
//  NewsListTableViewCell.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import UIKit
import UtilityPackage

final class NewsListTableViewCell: UITableViewCell, ViewRegistrable {

    @IBOutlet private weak var newImageView: UIImageView!
    @IBOutlet private weak var newsTitle: UILabel!
    @IBOutlet private weak var newsDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        selectionStyle = .none
    }
    
    class func load(from tableView: UITableView, with news: Article) -> NewsListTableViewCell {
        let cell: NewsListTableViewCell = tableView.dequeCell()
        cell.newImageView.loadImage(from: news.urlToImage)
        cell.newsTitle.text = news.title
        cell.newsDescription.attributedText = news.content?.htmlBodyStringWith(font: .systemFont(ofSize: 14), color: .lightGray)
        return cell
    }
}
