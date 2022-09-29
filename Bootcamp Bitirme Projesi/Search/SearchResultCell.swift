//
//  SearchResultCell.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 29.09.2022.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet weak var searchResultImage: UIImageView!
    @IBOutlet weak var searchResultName: UILabel!
    @IBOutlet weak var searchResultCity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
