//
//  NavigationController.swift
//  Cine SKY
//
//  Created by Zanette Ciriaco on 16/02/22.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func configure(title: String) {
        let titleBarAttibutes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                 NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]

        self.navigationBar.titleTextAttributes = titleBarAttibutes
        self.navigationBar.barTintColor = .customBlack
        self.navigationBar.isTranslucent = false
        self.navigationBar.backgroundColor = .customBlack
        self.navigationBar.barStyle = .black
        
        let image = UIImage(systemName: "arrow.left")

        self.navigationBar.backIndicatorImage = image
        self.navigationBar.tintColor = .white
        self.navigationBar.backIndicatorTransitionMaskImage = image
    }
}



