//
//  ForgotPasswordViewController.swift
//  Login_4K-Soft
//
//  Created by Anna on 08.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var imgBar: UIImageView!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var sendPasswordBtn: LoginButton!
    
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    static func storyboardInstance() -> ForgotPasswordViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        return vc
    }
    
    func initViewController() {
        emailTextField.becomeFirstResponder()
        emailTextField.text = email
        emailTextField.placeholder = Constant.String.email
        sendPasswordBtn.isEnabled = emailTextField.isValidData()
    }
    
    //MARK: - Action
    
    @IBAction func popToPreviousVC(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editChanged(_ sender: EmailTextField) {
        sendPasswordBtn.isEnabled = emailTextField.isValidData()
    }
    
    
    @IBAction func sendPassword(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        emailTextField.isHidden = true
        imgBar.image = UIImage.init(named: "done")
        lblInfo.text = Constant.String.thankWeAlreadySend + email
    }
    
}
extension ForgotPasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            textField.resignFirstResponder()
        }
        return false
    }
}
