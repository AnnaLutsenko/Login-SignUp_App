//
//  LoginViewController.swift
//  Login
//
//  Created by Anna on 05.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    /// UI Elements
    @IBOutlet weak var lblEnter: UILabel!
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var passwordTextField: PasswordTextField!
    @IBOutlet weak var enterBtn: UIButton!
    
    /// Managers
    let requestManager = RequestManager.shared
    let validationManager = ValidationManager()
    
    /// Constants
    let color = Constant.Color.self
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViewController()
    }
    
    func initViewController() {
        enterBtn.isEnabled = false
        emailTextField.becomeFirstResponder()
        //
        emailTextField.placeholder = Constant.String.email
        passwordTextField.placeholder = Constant.String.password
        //
        emailTextField.text = "test+1@mail.com"
        passwordTextField.text = "testtest"
        //
        enterBtn.isEnabled = isValidEmailAndPassword()
    }
    
    func openMenuVC() {
        // TODO: Open table view
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = vc
    }
    
    //MARK: - Action
    @IBAction func forgotPassword(_ sender: UIButton) {
        let vc = SignUpViewController.storyboardInstance()
        vc.email = emailTextField.text ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        
        if isValidEmailAndPassword() {
            requestManager.login(email: email, password: password, success: { user in
                DispatchQueue.main.async {
                    self.emailTextField.style = .default
                    self.openMenuVC()
                }
                
            }, failure: { (error) in
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.lblEnter.text = Constant.String.Error.wrongPassword
                    self.lblEnter.textColor = UIColor.init(hex:  self.color.redError)
                    self.passwordTextField.style = .error
                }
                
            })
        }
    }
    
    @IBAction func valueCanged(_ sender: LoginTextField) {
        lblEnter.text = Constant.String.enter
        lblEnter.textColor = UIColor.init(hex: color.grayText)
        sender.style = .active
        enterBtn.isEnabled = isValidEmailAndPassword()
    }
    
    func isValidEmailAndPassword() -> Bool {
        return emailTextField.isValidData() && passwordTextField.isValidData()
    }
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == emailTextField) {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}

