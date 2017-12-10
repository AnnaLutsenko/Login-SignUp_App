//
//  Constant.swift
//  Login_4K-Soft
//
//  Created by Anna on 06.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import Foundation

struct Constant {
    struct String {
        static let email = "E-mail"
        static let password = "Пароль"
        static let enter = "Вход"
        
        static let thankWeAlreadySend = "Спасибо, мы уже отправили письмо с новым паролем на почту "
        
        struct Error {
            static let wrongPassword = "Неверный пароль"
        }
    }
    
    
    struct Color {
        static let redError = "FC4D42"
        static let blueBtn = "9DB5F0"
        static let blueLightBtn = "CED9FB"
        static let grayActiveBorderTF = "A9A9A9"
        static let grayNotActiveTF = "F1F1F1"
        static let grayTextInfo = "888888"
        static let grayText = "111111"
        static let grayTxtPlaceholder = "707070"
    }
}
