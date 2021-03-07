//
//  Environment.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/6/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

struct Env {

    private static let production : Bool = {
        #if Dev
            return false
        #elseif QA
            return false
        #else
            return true
        #endif
    }()

    static func isProduction () -> Bool {
        return self.production
    }
}
