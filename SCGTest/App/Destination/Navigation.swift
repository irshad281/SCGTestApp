//
//  Navigation.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import Foundation
import UIKit

extension App {
    static func navigate(to destination: Destination, from navigationController: UINavigationController?, animated: Bool = true) {
        
        let viewController: UIViewController
        
        switch destination {
        case .newsList:
            viewController = UIViewController()
            
        case.newDetail(let article):
            viewController = NewsDetailViewController(article: article)
        }

        navigationController?.pushViewController(viewController, animated: true)
    }
}
