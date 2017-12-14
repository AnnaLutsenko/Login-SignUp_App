//
//  LogoImageView.swift
//  Login_4K-Soft
//
//  Created by Anna on 14.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class LogoImageView: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.5, height: 3)
    }
}
