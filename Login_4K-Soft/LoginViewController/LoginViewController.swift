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
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterBtn: UIButton!
    
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
        
        emailTextField.becomeFirstResponder()
        emailTextField.placeholder = Constant.String.email
        passwordTextField.placeholder = Constant.String.password
        
    }
    //MARK: - Action
    @IBAction func forgotPassword(_ sender: UIButton) {
        let vc = ForgotPasswordViewController.storyboardInstance()
        self.navigationController?.pushViewController(vc, animated: true)
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

