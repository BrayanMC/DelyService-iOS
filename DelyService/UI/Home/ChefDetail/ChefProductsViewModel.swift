//
//  ProductsChefViewModel.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/12/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import Foundation

protocol ChefProductsViewModelClosures {
    var showProductDetail: ((Product) -> Void)? { get set }
}

class ChefProductsViewModel: ChefProductsViewModelClosures {
    
    public var products: [Product] = []
    
    public var loading = DelegatedCall<Bool>()
    public var showProducts = DelegatedCall<[Product]>()
    
    var showProductDetail: ((Product) -> Void)?
    
    public init() {}
    
    public func loadProducts(products: [Product]) {
        self.loading.callback?(true)
        self.products = products
        self.loading.callback?(false)
        self.showProducts.callback?(self.products)
    }
}
