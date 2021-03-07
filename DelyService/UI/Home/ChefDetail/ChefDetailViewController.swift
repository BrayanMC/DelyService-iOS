//
//  ProductsChefViewController.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/12/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

final class ProductsChefViewController: UIViewController, InstantiableController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addBorderToAddButton()
    }
    
    private func setUI() {}
    
    private func bind() {}
    
    private func addBorderToAddButton() {}
    
    static func instance() -> ProductsChefViewController {
        
    }
}
