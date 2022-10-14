//
//  FlightDetailsVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 10.10.2022.
//

import UIKit

class FlightDetailsVC: UIViewController {

    @IBOutlet weak var backButtonView: UIView!
   
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsImage.layer.cornerRadius = 8.0
        detailsImage.clipsToBounds = true
        detailsImage.contentMode = .scaleToFill
        
        descriptionLabel.sizeToFit()
        
        backButtonView.layer.cornerRadius = backButtonView.frame.size.height / 2
        backButtonView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "flightsVC") as! FlightsVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: false)
    }
}
