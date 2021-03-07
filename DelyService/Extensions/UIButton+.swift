//
//  UIButton+.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/13/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

extension UIButton {
    
    func changeImage(image: ImageName) {
        setBackgroundImage(UIImage(named: image.rawValue), for: .normal)
    }
}
