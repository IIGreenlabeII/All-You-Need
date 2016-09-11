//
//  VoteCell.swift
//  All You Need
//
//  Created by Shailin Biharie on 11-09-16.
//  Copyright © 2016 Shailin Biharie. All rights reserved.
//

import UIKit

class VoteCell: UITableViewCell {

    @IBOutlet var artist: UILabel!
    @IBOutlet var song: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
