//
//  String+.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/5/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

extension String {
    
    private enum StringValidation {
        case email
        case phoneNumber
    }
    
    private func isValid(type: StringValidation) -> Bool {
        var regularExp = ""
        switch type {
        case .email:
            regularExp = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        case .phoneNumber:
            regularExp = "[789][0-9]{9}"
        }
        let test = NSPredicate(format:"SELF MATCHES %@", regularExp)
        return test.evaluate(with: self)
    }
    
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: .whitespaces)
            return trimmed.isEmpty
        }
    }
    
    var isValidEmail: Bool {
        return self.isValid(type: .email)
    }
    
    var passwordHasNumberOfCharactersAllowed: Bool {
        return self.count < 8
    }
}
