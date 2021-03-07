//
//  LogInViewController.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 4/27/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

final class LogInViewController: UIViewController, InstantiableController, AlertableController {
    
    @IBOutlet weak var vwBackground: UIView!
    @IBOutlet weak var vwSignInComponent: UIView!
    @IBOutlet weak var vwSignUpComponent: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfNewEmail: UITextField!
    @IBOutlet weak var tfNewPassword: UITextField!
    @IBOutlet weak var tfRepeatNewPassword: UITextField!
    @IBOutlet weak var btnShowPassword: UIButton!
    @IBOutlet weak var btnShowNewPassword: UIButton!
    @IBOutlet weak var btnShowRepeatNewPassword: UIButton!
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    private var logInViewModel = LogInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private func setUI() {
        vwSignUpComponent.isHidden = true

        vwBackground.clipsToBounds = true
        vwBackground.layer.cornerRadius = 16
        vwBackground.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        btnLogIn.clipsToBounds = true
        btnLogIn.layer.cornerRadius = 4
        btnLogIn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    
        btnCreate.clipsToBounds = true
        btnCreate.layer.cornerRadius = 4
        btnCreate.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        btnSignIn.clipsToBounds = true
        btnSignIn.layer.cornerRadius = 4
        btnSignIn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        btnSignIn.isHidden = true
        
        btnSignUp.clipsToBounds = true
        btnSignUp.layer.cornerRadius = 4
        btnSignUp.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        btnSignUp.clipsToBounds = true
        btnSignUp.layer.cornerRadius = 4
        btnSignUp.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
    
    private func bind() {
        logInViewModel.message.delegate(to: self) { (self, message) in
            debugPrint(message)
            self.show(message: message)
        }
        
        logInViewModel.goToHome.delegate(to: self) { (self, success) in
            if (success) {
                self.initHomeView()
            }
        }
    }
    
    private func initHomeView() {
        self.navigationController?.pushViewController(HomeViewController.instance(), animated: true)
    }
    
    private func changeVisibility(showSignInFields: Bool) {
        vwSignInComponent.isHidden = showSignInFields
        vwSignUpComponent.isHidden = !showSignInFields
        btnSignIn.isHidden = !showSignInFields
        btnSignUp.isHidden = showSignInFields
    }
    
    private func cleanFields() {
        tfEmail.text = ""
        tfPassword.text = ""
        tfNewEmail.text = ""
        tfNewPassword.text = ""
        tfRepeatNewPassword.text = ""
    }
    
    static func instance() -> LogInViewController {
        return StoryBoardManager.default.initViewController(from: .login, with: .logInViewController) as! LogInViewController
    }
    
    @IBAction func logIn(_ sender: Any) {
        logInViewModel.logIn(tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "", tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
    }
    
    @IBAction func singUp(_ sender: Any) {
        logInViewModel.signIn(tfNewEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "", tfNewPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "", tfRepeatNewPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
    }
    
    @IBAction func toggleShowPassword(_ sender: Any) {
        tfPassword.isSecureTextEntry = !tfPassword.isSecureTextEntry
        let image = tfPassword.isSecureTextEntry ? UIImage(named: "eye_open") : UIImage(named: "eye_close")
        btnShowPassword.setBackgroundImage(image, for: .normal)
    }
    
    @IBAction func toggleShowNewPassword(_ sender: Any) {
        tfNewPassword.isSecureTextEntry = !tfNewPassword.isSecureTextEntry
        let image = tfNewPassword.isSecureTextEntry ? UIImage(named: "eye_open") : UIImage(named: "eye_close")
        btnShowNewPassword.setBackgroundImage(image, for: .normal)
    }
    
    @IBAction func toggleShowNewRepeatPassword(_ sender: Any) {
        tfRepeatNewPassword.isSecureTextEntry = !tfRepeatNewPassword.isSecureTextEntry
        let image = tfRepeatNewPassword.isSecureTextEntry ? UIImage(named: "eye_open") : UIImage(named: "eye_close")
        btnShowRepeatNewPassword.setBackgroundImage(image, for: .normal)
    }
    
    @IBAction func gotToForgotPasswordView(_ sender: Any) {
        self.present(ForgotPasswordViewController.instance(), animated: true, completion: nil)
    }
    
    @IBAction func showSignInComponent(_ sender: Any) {
        changeVisibility(showSignInFields: false)
        cleanFields()
    }
    
    @IBAction func showSignUpComponent(_ sender: Any) {
        changeVisibility(showSignInFields: true)
        cleanFields()
    }
}

