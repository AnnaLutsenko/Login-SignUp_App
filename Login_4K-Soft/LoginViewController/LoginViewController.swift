//
//  LoginViewController.swift
//  Login_4K-Soft
//
//  Created by Anna on 05.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var passwordTextField: PasswordTextField!
    @IBOutlet weak var enterBtn: UIButton!
    
    let requestManager = RequestManager()
    let validationManager = ValidationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViewController()
        
    }
    
    func initViewController() {
        let borderColor = UIColor.init(hex: Constant.Color.grayNotActiveTF).cgColor
       
        imgLogo.layer.cornerRadius = 20
        imgLogo.layer.borderWidth = 1
        imgLogo.layer.borderColor = borderColor
        imgLogo.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        enterBtn.isEnabled = false
        
        emailTextField.becomeFirstResponder()
        emailTextField.placeholder = Constant.String.email
        passwordTextField.placeholder = Constant.String.password
    }
    //MARK: - Action
    @IBAction func forgotPassword(_ sender: UIButton) {
        let vc = ForgotPasswordViewController.storyboardInstance()
        vc.email = emailTextField.text ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        
        if isValidEmailAndPassword() {
            requestManager.signIn(email: email, password: password, success: {
                
                
            }, failure: { (error) in
                print(error.localizedDescription)
            })
        }
        
        
    }
    
    @IBAction func valueCanged(_ sender: UITextField) {
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

