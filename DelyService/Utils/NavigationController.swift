//
//  NavigationController.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/5/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    
    // MARK: - Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barStyle = .black
        navigationBar.backgroundColor = .white
        navigationBar.tintColor = .redF96363
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()
    }
    
    // MARK: - Methods
    
    private func setup() {
        isNavigationBarHidden = true
        modalPresentationStyle = .fullScreen
    }
}
