//
//  LoginTextField.swift
//  Login_4K-Soft
//
//  Created by Anna on 06.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let borderColor = UIColor.init(hex: Constant.Color.grayNotActiveTF).cgColor
        let placeholderColor = UIColor.init(hex: Constant.Color.grayTxtPlaceholder)
        
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.layer.borderColor = borderColor
        self.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedStringKey.foregroundColor: placeholderColor])
        self.layer.sublayerTransform =  CATransform3DMakeTranslation(16, 0, 0)

    }

    override func becomeFirstResponder() -> Bool {
        self.layer.borderColor = UIColor.init(hex: Constant.Color.grayActiveBorderTF).cgColor
        return super.becomeFirstResponder()
    }
    override func resignFirstResponder() -> Bool {
        self.layer.borderColor = UIColor.init(hex: Constant.Color.grayNotActiveTF).cgColor
        return super.resignFirstResponder()
    }
}
