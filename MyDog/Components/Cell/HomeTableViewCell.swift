//
//  HomeTableViewCell.swift
//  MyDog
//
//  Created by Estefania Sassone on 07/08/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var imgDog: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        card.layer.cornerRadius = 15
        imgDog.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
