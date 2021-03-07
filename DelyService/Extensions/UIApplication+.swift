//
//  UIApplication+.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/5/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

extension UIApplication {
    
    // MARK: - UINavigationBar
    
    func applyDefaultNavigationBarAppearance() {
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().tintColor = .redF96363
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().layer.masksToBounds = false
        UINavigationBar.appearance().clipsToBounds = false
        
        let navigationBarAttributes = [
            //NSAttributedString.Key.font: UIFont.robotoBold(size: 16.0),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        UINavigationBar.appearance().titleTextAttributes = navigationBarAttributes
    }
    
    // MARK: - UITabBar
    
    func applyDefaultTabBarAppearance() {
        UITabBar.appearance().tintColor = .redF96363
    }
    
    // MARK: - BarButtonItem
    
    func applyDefaultBarButtonItemAppearance() {
        let normalAttributes = [
            //NSAttributedString.Key.font: UIFont.robotoCondensed(size: 16.0),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        let highlightedAttributes = [
            //NSAttributedString.Key.font: UIFont.robotoCondensed(size: 16.0),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        let disableAttributes = [
            //NSAttributedString.Key.font: UIFont.robotoCondensed(size: 16.0),
            NSAttributedString.Key.foregroundColor: UIColor.redF96363
        ]
        
        UIBarButtonItem.appearance().setTitleTextAttributes(normalAttributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(normalAttributes, for: .focused)
        UIBarButtonItem.appearance().setTitleTextAttributes(normalAttributes, for: .focused)
        UIBarButtonItem.appearance().setTitleTextAttributes(normalAttributes, for: .selected)
        UIBarButtonItem.appearance().setTitleTextAttributes(highlightedAttributes, for: .highlighted)
        UIBarButtonItem.appearance().setTitleTextAttributes(disableAttributes as [NSAttributedString.Key : Any], for: .disabled)
    }
}
