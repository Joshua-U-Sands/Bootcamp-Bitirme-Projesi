//
//  HotelDetailsVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 10.10.2022.
//

import UIKit

class HotelDetailsVC: UIViewController {

    var isSaved = false
    var x = 0
    
    @IBOutlet weak var bookmarkButton: UIButton!
    
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
        
        bookmarkButton.layer.backgroundColor = UIColor(red: 1, green: 0.28, blue: 0.375, alpha: 1).cgColor
        
        bookmarkButton.layer.cornerRadius = 8
        
        bookmarkButton.titleLabel?.textColor = UIColor.white
        bookmarkButton.titleLabel?.font = UIFont(name: "Montserrat", size: 16.0)
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
    @IBAction func bookmarkPressed(_ sender: UIButton) {
        if isSaved == false {
            
        }
    }
}
