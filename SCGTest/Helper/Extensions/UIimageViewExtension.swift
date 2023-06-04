//
//  UIimageViewExtension.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(from url: String?) {
        let source = URL(string: url ?? "")
        self.kf.setImage(with: source, placeholder: UIImage(named: "news-placeholder")) { result in
            switch result {
            case .success(let data):
                self.image = data.image
                
            case .failure:
                break
            }
        }
    }
}
