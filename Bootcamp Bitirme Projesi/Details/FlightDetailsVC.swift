//
//  FlightDetailsVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 10.10.2022.
//

import UIKit

class FlightDetailsVC: UIViewController {

    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsImage.layer.cornerRadius = 8.0
        detailsImage.clipsToBounds = true
        
        descriptionLabel.sizeToFit()
        
    }
}
