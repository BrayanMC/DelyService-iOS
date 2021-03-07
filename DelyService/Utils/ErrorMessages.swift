//
//  ErrorMessages.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/5/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import Foundation

enum ValidationError: Error {
    
    case none
    case emailEmpty
    case invalidEmail
    case passwordEmpty
    case invalidPassword
    case confirmPasswordEmpty
    
    var localizedDescription: String {
        switch self {
        case .none:
            return ""
        case .emailEmpty:
            return NSLocalizedString("EMAIL_ADDRESS_EMPTY", comment: "")
        case .invalidEmail:
            return NSLocalizedString("INVALID_EMAIL_ADDRESS", comment: "")
        case .passwordEmpty:
            return NSLocalizedString("PASSWORD_EMPTY", comment: "")
        case .invalidPassword:
            return NSLocalizedString("INVALID_PASSWORD", comment: "")
        case .confirmPasswordEmpty:
            return NSLocalizedString("CONFIRM_PASSWORD_EMPTY", comment: "")
        }
    }
}
