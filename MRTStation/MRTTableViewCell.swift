//
//  MRTTableViewCell.swift
//  MRTStation
//
//  Created by mac on 2016/5/23.
//  Copyright © 2016年 ssiang1627. All rights reserved.
//

import UIKit

class MRTTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var lineLabel1: UILabel!
    @IBOutlet weak var lineNumberLabel1: UILabel!
    @IBOutlet weak var lineLabel2: UILabel!
    @IBOutlet weak var lineNumberLabel2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

