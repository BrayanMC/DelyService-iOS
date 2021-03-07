//
//  Protocols.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/7/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

// MARK: - NibLoadableView

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
}

extension UIView: NibLoadableView {}

// MARK: - ReusableView

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
