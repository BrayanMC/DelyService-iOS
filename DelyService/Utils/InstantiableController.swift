//
//  InstantiableController.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/5/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

protocol InstantiableController: class {
    
    static func instance() -> Self
    static func navigationInstance() -> NavigationController
}

extension InstantiableController where Self: UIViewController {
    
    static func navigationInstance() -> NavigationController {
        return NavigationController(rootViewController: Self.instance())
    }
}

