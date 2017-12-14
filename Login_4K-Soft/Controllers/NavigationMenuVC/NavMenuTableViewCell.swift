//
//  NavMenuTableViewCell.swift
//  Login_4K-Soft
//
//  Created by Anna on 14.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class NavMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
