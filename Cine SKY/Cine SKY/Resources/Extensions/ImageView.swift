//
//  ImageView.swift
//  Cine SKY
//
//  Created by Zanette Ciriaco on 15/02/22.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(url: String, completion: @escaping() -> Void) {
        guard let url = URL(string: url) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        completion()
                    
                    }
                }
            }
        }
    }
}

