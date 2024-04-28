//
//  HomeTableViewCell.swift
//  TableView Custom Cell
//
//  Created by robusta on 28/04/2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var fruitImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var priceLabe: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var favouriteButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(image: UIImage , name: String , price: String , description: String) {
        
        fruitImage.image = image
        nameLabel.text = name
        priceLabe.text = price
        descriptionLabel.text = description
    }

    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        
        if sender.image(for: .normal) == UIImage(systemName: "heart") {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
}
