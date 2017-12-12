//
//  MenuTableViewCell.swift
//  Login_4K-Soft
//
//  Created by Anna on 12.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var teamCountLabel: UILabel!
    @IBOutlet weak var copyCountLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundImg?.layer.cornerRadius = 8
        numberLabel.layer.cornerRadius = 12
        numberLabel.backgroundColor = UIColor.init(hex: Constant.Color.purple)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func moreAction(_ sender: UIButton) {
        
    }
}
