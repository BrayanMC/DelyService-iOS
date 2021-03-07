//
//  LogInViewModel.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 4/29/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

class LogInViewModel {
    
    public var message = DelegatedCall<String>()
    public var goToHome = DelegatedCall<Bool>()
    
    public init() {}
    
    func logIn(_ email: String, _ password: String) {
        if Env.isProduction() {
            if (email.isBlank) {
                self.message.callback?(ValidationError.emailEmpty.localizedDescription)
                return
            }
            
            if (!email.isValidEmail) {
                self.message.callback?(ValidationError.invalidEmail.localizedDescription)
                return
            }
            
            if (password.isBlank) {
                self.message.callback?(ValidationError.passwordEmpty.localizedDescription)
                return
            }
            
            if (password.passwordHasNumberOfCharactersAllowed) {
                self.message.callback?(ValidationError.invalidPassword.localizedDescription)
                return
            }
        }
        
        self.goToHome.callback?(true)
    }
    
    func signIn(_ newEmail: String, _ newPassword: String, _ repeatNewPassword: String) {
        if (newEmail.isBlank) {
            self.message.callback?(ValidationError.emailEmpty.localizedDescription)
            return
        }
        
        if (!newEmail.isValidEmail) {
            self.message.callback?(ValidationError.invalidEmail.localizedDescription)
            return
        }
        
        if (newPassword.isBlank) {
            self.message.callback?(ValidationError.passwordEmpty.localizedDescription)
            return
        }
        
        if (newPassword.passwordHasNumberOfCharactersAllowed) {
            self.message.callback?(ValidationError.invalidPassword.localizedDescription)
            return
        }
        
        if (newPassword != repeatNewPassword) {
            self.message.callback?(ValidationError.confirmPasswordEmpty.localizedDescription)
            return
        }
        
        self.message.callback?("Created account")
        self.goToHome.callback?(true)
    }
}
