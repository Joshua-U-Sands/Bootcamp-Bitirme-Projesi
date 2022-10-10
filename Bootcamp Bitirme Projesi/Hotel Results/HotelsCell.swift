//
//  HotelsCell.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 10.10.2022.
//

import UIKit

class HotelsCell: UITableViewCell {

    @IBOutlet weak var hotelsCellImage: UIImageView!
    @IBOutlet weak var hotelsDescription: UILabel!
    @IBOutlet weak var hotelsName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
