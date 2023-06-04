//
//  App.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import Foundation
import NetworkInterface
import Combine
import UIKit

typealias Response<T: Codable> = Future<T, RequestError>

enum App {
    /// App's Envirenment
    static var enrironment: Environment { .stage }
    
    /// App's Configuration
    static let configuration: AppConfiguration = .init()
    
    static var delegate: AppDelegate? {UIApplication.shared.delegate as? AppDelegate }
}

extension App {
    static func makeRootView() {
        if delegate?.window == nil {
            delegate?.window = UIWindow(frame: UIScreen.main.bounds)
            let controller = NewsListViewController()
            controller.title = "News"
            let navigation = UINavigationController(rootViewController: NewsListViewController())
            navigation.navigationBar.isHidden = false
            delegate?.window?.rootViewController = navigation
            delegate?.window?.makeKeyAndVisible()
        }
    }
    
    ///  Display in app alert message
    /// - Parameters:
    ///   - title: title for alert
    ///   - message: message for alert
    static func showAlert(withTitle title: String, message: String?) {
        let alrt = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alrt.addAction(ok)
        UIApplication.shared.currentController?.present(alrt, animated: true, completion: nil)
    }
}
