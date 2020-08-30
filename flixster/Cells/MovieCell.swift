//
//  MovieCell.swift
//  flixster
//
//  Created by Andy Wang on 8/30/20.
//  Copyright © 2020 andywang1197@icloud.com. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    // outlets
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var synopsisLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
