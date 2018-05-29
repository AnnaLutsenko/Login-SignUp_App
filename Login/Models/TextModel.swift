//
//  TextModel.swift
//  Login
//
//  Created by Anna on 21.05.2018.
//  Copyright © 2018 Anna Lutsenko. All rights reserved.
//

import Unbox

struct TextModel {
    var text: String?
    
    func getCharCount() -> [Character: Int]? {
        guard let txt = text else {return nil}
        
        var dict = [Character: Int]()
        for char in txt {
            if let val = dict[char]{
                dict[char] = val + 1
            } else {
                dict[char] = 1
            }
        }
        
        return dict
    }
}

extension TextModel : Unboxable {
    init(unboxer: Unboxer) throws {
        self.text = try? unboxer.unbox(key: "data")
    }
}
