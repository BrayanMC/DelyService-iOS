//
//  StoryBoardManager.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/5/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

class StoryBoardManager {
    
    enum StoryBoardName: String {
        case login = "LogIn"
        case forgotPassword = "ForgotPassword"
        case home = "Home"
        case chefProducts = "ChefProducts"
        
        var storyBoard: UIStoryboard {
            return UIStoryboard(name: self.rawValue, bundle: nil)
        }
    }
    
    enum StoryboardIdentifier: String {
        case logInViewController = "LogInViewController"
        case forgotPasswordViewController = "ForgotPasswordViewController"
        case homeViewController = "HomeViewController"
        case chefProductsViewController = "ChefProductsViewController"
    }
    
    class var `default`: StoryBoardManager {
        struct Singleton {
            static let shared = StoryBoardManager()
        }
        return Singleton.shared
    }
    
    private init() { }
    
    func initViewController<T: UIViewController>(from storyBoard: StoryBoardName, with identifier: StoryboardIdentifier) -> T {
        return storyBoard.storyBoard.instantiateViewController(withIdentifier: identifier.rawValue) as! T
    }
}
