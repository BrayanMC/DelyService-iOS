//
//  ForgotPasswordViewController.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 4/30/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController, AlertableController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    
    private var forgotPasswordViewModel = ForgotPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
    }
    
    private func setUI() {
        btnSend.clipsToBounds = true
        btnSend.layer.cornerRadius = 4
        btnSend.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
    
    private func bind() {
        forgotPasswordViewModel.message.delegate(to: self) { (self, message) in
            debugPrint(message)
            self.show(message: message)
        }
        
        forgotPasswordViewModel.back.delegate(to: self) { (self, success) in
            if (success) {
                self.dismiss()
            }
        }
    }
    
    private func dismiss() {
        if (navigationController != nil) {
            navigationController?.popViewController(animated: true)
        }
        dismiss(animated: true, completion: nil)
    }
    
    static func instance() -> ForgotPasswordViewController {
        return StoryBoardManager.default.initViewController(from: .forgotPassword, with: .forgotPasswordViewController) as! ForgotPasswordViewController
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        forgotPasswordViewModel.sendEmail(tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
    }
    
    @IBAction private func back() {
        dismiss()
    }
}
