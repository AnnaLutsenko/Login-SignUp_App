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
    
    @IBOutlet weak var lblEnter: UILabel!
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var passwordTextField: PasswordTextField!
    @IBOutlet weak var enterBtn: UIButton!
    
    let requestManager = RequestManager()
    let validationManager = ValidationManager()
    let color = Constant.Color.self
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViewController()
    }
    
    func initViewController() {
        imgLogo.layer.cornerRadius = 20
        imgLogo.layer.borderWidth = 1
        imgLogo.layer.borderColor = UIColor.init(hex: color.grayNotActiveTF).cgColor
        imgLogo.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        emailTextField.becomeFirstResponder()
        emailTextField.placeholder = Constant.String.email
        passwordTextField.placeholder = Constant.String.password
        
        emailTextField.text = "admin-user-2@exmpl.cm"
        passwordTextField.text = "admin-user-2"
        enterBtn.isEnabled = isValidEmailAndPassword()
    }
    
    func openMenuVC() {
        let vc = ContainerViewController.storyboardInstance()
        self.navigationController?.viewControllers = [vc]
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
            requestManager.signIn(email: email, password: password, success: { user in
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
        self.lblEnter.text = Constant.String.enter
        self.lblEnter.textColor = UIColor.init(hex:  color.grayText)
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

