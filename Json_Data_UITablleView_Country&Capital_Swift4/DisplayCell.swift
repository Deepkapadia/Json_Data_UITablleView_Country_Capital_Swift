//
//  DisplayCell.swift
//  Json_Data_UITablleView_Country&Capital_Swift4
//
//  Created by DeEp KapaDia on 27/05/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class DisplayCell: UITableViewCell {

    @IBOutlet weak var Namelbl: UILabel!
    
    @IBOutlet weak var RegionLbl: UILabel!
    
    @IBOutlet weak var CapitalLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
