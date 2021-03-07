//
//  ForgotPasswordViewModel.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 4/30/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

class ForgotPasswordViewModel {
    
    public var message = DelegatedCall<String>()
    public var back = DelegatedCall<Bool>()
    
    public init() {}
    
    func sendEmail(_ email: String) {
        if (email.isBlank) {
            self.message.callback?(ValidationError.emailEmpty.localizedDescription)
            return
        }
        
        if (!email.isValidEmail) {
            self.message.callback?(ValidationError.invalidEmail.localizedDescription)
            return
        }
        
        self.message.callback?("Email sent")
        self.back.callback?(true)
    }
}
