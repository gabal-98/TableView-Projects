//
//  CityTableViewCell.swift
//  TableView ( Cell self cizing )
//
//  Created by robusta on 29/04/2024.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet var cityImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
