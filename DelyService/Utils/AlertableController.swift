//
//  AlertableController.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/5/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

protocol AlertableController: class {
    
    func show(title: String?, message: String, actionTitle: String?, cancelTitle: String?, completion: (() -> Void)?)
}

extension AlertableController where Self: UIViewController {
    
    func show(title: String? = "",
              message: String,
              actionTitle: String? = nil,
              cancelTitle: String? = "Aceptar",
              completion: (() -> Void)? = nil) {
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: cancelTitle, style: .default, handler: { _ in
            if actionTitle == nil {
                completion?()
            }
        })
        controller.addAction(cancel)
        
        if let actionTitle = actionTitle {
            let action = UIAlertAction(title: actionTitle, style: .default, handler: { _ in
                completion?()
            })
            controller.addAction(action)
        }
        
        self.present(controller, animated: true, completion: nil)
    }
    
    func showConfirm(title: String? = "",
                     message: String,
                     actionTitle: String? = "Sí",
                     cancelTitle: String? = "No",
                     completion: (() -> Void)? = nil) {
        
        show(title: title,
             message: message,
             actionTitle: actionTitle,
             cancelTitle: cancelTitle,
             completion: completion)
    }
}
