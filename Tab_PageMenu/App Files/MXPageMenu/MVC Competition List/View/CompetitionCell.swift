//
//  competitionCell.swift
//  Slyde
//
//  Created by Anurag on 12/12/17.
//  Copyright © 2017 Techugo. All rights reserved.
//

import UIKit

class CompetitionCell: UITableViewCell {

    @IBOutlet weak var vwBackGround: UIView!
    @IBOutlet weak var competitionNameLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        vwBackGround.layer.cornerRadius = 4.0
        vwBackGround.clipsToBounds = true
        layer.cornerRadius = 2
        layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
