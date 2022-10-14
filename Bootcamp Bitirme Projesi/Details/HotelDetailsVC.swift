//
//  HotelDetailsVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 10.10.2022.
//

import UIKit

class HotelDetailsVC: UIViewController {

    var x = 0
    
    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backButtonView.layer.cornerRadius = backButtonView.frame.size.height / 2
        backButtonView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        detailsImage.layer.cornerRadius = 8.0
        detailsImage.clipsToBounds = true
        detailsImage.contentMode = .scaleToFill
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
       
        if x == 0{
            let vc = storyboard?.instantiateViewController(withIdentifier: "hotelsVC") as! HotelsVC
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: true)
            
            
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "flightsVC") as! FlightsVC
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: true)
            
        }
    }
}
