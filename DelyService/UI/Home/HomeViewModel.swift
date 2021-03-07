//
//  HomeViewModel.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/5/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import Foundation

protocol ChefsViewModelClosures {
    var showChefProducts: ((Chef) -> Void)? { get set }
}

protocol ChefsListViewModel: ChefsViewModelClosures {}

class HomeViewModel: ChefsListViewModel {
    
    public var chefs: [Chef] = []
    
    public var loading = DelegatedCall<Bool>()
    public var showChefs = DelegatedCall<[Chef]>()
    
    var showChefProducts: ((Chef) -> Void)?
    
    public init() {}
    
    public func loadChefs() {
        self.loading.callback?(true)
        chefs = [
            Chef(name: "Jorge Morgan", photo: "profile", rating: "4.9", address: "Av. Los Alamos 141, SJM", latitude: -12.168604, longitude: -76.981833, distance: "1.2 KM", availability: true, description: "Pastelería y catering a domicilio. Hoy, mañana y siempre. Lo que sea necesario. Un, dos, tres. Arriba alianza. Vamos PERÚ. Una línea más. Bueno, otra línea más. Y así termina todo, gracias. Puntos suspensivosssssssssssssssssss.", picture: "presentation_2", isMarked: true, isSaved: false, products: [Product(name: "Arroz verde con pollo", photo: "product_1", complement: "+ ensalada y/o caldo y jugo de chicha (adicional cremas y/o cancha)", price: 10.00, hasOffer: true, discountRate: 20.0, offerPrice: 8.00), Product(name: "Lomo saltado con papas fritas", photo: "product_2", complement: "+ ensalada y/o caldo y jugo de chicha (adicional cremas y/o cancha)", price: 12.50, hasOffer: false, discountRate: 0.0, offerPrice: 12.50)]),
            Chef(name: "Camilo Sexto", photo: "profile", rating: "0.4", address: "Av. Los Faisanes 151, Chorrillos", latitude: -12.182467, longitude: -77.003664, distance: "4.3 KM", availability: false, description: "Catering y pastelería para despacho en tienda. Hoy, mañana y siempre. Lo que sea necesario. Un, dos, tres. Arriba alianza. Vamos PERÚ. Una línea más. Bueno, otra línea más. Y así termina todo, gracias. Puntos suspensivosssssssssssssssssss.", picture: "presentation_1", isMarked: false, isSaved: true, products: [Product(name: "Arroz verde con pollo", photo: "product_2", complement: "+ ensalada y/o caldo y jugo de chicha (adicional cremas y/o cancha)", price: 22.50, hasOffer: false, discountRate: 0.0, offerPrice: 22.50)])]
        self.loading.callback?(false)
        self.showChefs.callback?(chefs)
    }
}

