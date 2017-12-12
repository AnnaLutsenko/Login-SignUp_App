//
//  LoginButton.swift
//  Login_4K-Soft
//
//  Created by Anna on 08.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class LoginButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor.white
        self.setTitleColor(UIColor.init(hex: Constant.Color.blueLightBtn), for: .normal)
        self.layer.borderColor = UIColor.init(hex: Constant.Color.blueLightBtn).cgColor
    }
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? UIColor.init(hex: Constant.Color.blueBtn) : UIColor.white
            let titleColor = isEnabled ? UIColor.white : UIColor.init(hex: Constant.Color.blueLightBtn)
            setTitleColor(titleColor, for: .normal)
            layer.borderColor = isEnabled ? UIColor.init(hex: Constant.Color.blueBtn).cgColor : UIColor.init(hex: Constant.Color.blueLightBtn).cgColor
        }
    }

}
