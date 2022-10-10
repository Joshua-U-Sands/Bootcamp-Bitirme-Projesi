//
//  FlightsCell.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 10.10.2022.
//

import UIKit

class FlightsCell: UITableViewCell {

    @IBOutlet weak var flightName: UILabel!
    @IBOutlet weak var flightResultImage: UIImageView!
    @IBOutlet weak var flightDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
