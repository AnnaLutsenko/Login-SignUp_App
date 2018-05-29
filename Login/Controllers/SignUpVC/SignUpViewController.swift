//
//  SignUpViewController.swift
//  Login
//
//  Created by Anna on 08.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTF: NameTextField!
    @IBOutlet weak var emailTF: EmailTextField!
    @IBOutlet weak var passwordTF: PasswordTextField!
    @IBOutlet weak var signUpBtn: LoginButton!
    
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    static func storyboardInstance() -> SignUpViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        return vc
    }
    
    func initViewController() {
        nameTF.becomeFirstResponder()
        emailTF.text = email
        //
        nameTF.placeholder = Constant.String.name
        emailTF.placeholder = Constant.String.email
        passwordTF.placeholder = Constant.String.password
        //
        signUpBtn.isEnabled = false
    }
    
    func isValidEmailAndPassword() -> Bool {
        return emailTF.isValidData() && passwordTF.isValidData()
    }
    
    //MARK: - Action
    
    @IBAction func popToPreviousVC(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editChanged(_ sender: UITextField) {
        signUpBtn.isEnabled = (isValidEmailAndPassword() && !(nameTF.text?.isEmpty)!)
    }
    
    @IBAction func signUpBtnClicked(_ sender: UIButton) {
        
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case nameTF:
            emailTF.becomeFirstResponder()
        case emailTF:
            passwordTF.becomeFirstResponder()
        case passwordTF:
            passwordTF.resignFirstResponder()
        default:
            break
        }
        return false
    }
}
