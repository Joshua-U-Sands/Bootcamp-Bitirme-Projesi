//
//  BookmarkCell.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 9.10.2022.
//

import UIKit

class BookmarkCell: UITableViewCell {

    @IBOutlet weak var bookmarkImage: UIImageView!
    @IBOutlet weak var bookmarkName: UILabel!
    @IBOutlet weak var bookmarkDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
