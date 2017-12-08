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
        self.layer.backgroundColor = UIColor.white.cgColor
        self.setTitleColor(UIColor.init(hex: Constant.Color.blueLightBtn), for: .normal)
        self.layer.borderColor = UIColor.init(hex: Constant.Color.blueLightBtn).cgColor
    }

}
