//
//  UICollectionView+.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/7/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type)  {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    /*func setupHighlightedView(color: UIColor = UIColor(hex: "2E86EF")) -> UIView {
        
        let flowLayout = self.collectionViewLayout as! UICollectionViewFlowLayout
        
        let frame = CGRect(x: 0.0, y: self.bounds.height - 3.0, width: flowLayout.itemSize.width, height: 3.0)
        let highlightedView = UIView(frame: frame)
        highlightedView.backgroundColor = color
        
        self.addSubview(highlightedView)
        
        return highlightedView
    }*/
}

extension UICollectionViewCell: ReusableView {}
