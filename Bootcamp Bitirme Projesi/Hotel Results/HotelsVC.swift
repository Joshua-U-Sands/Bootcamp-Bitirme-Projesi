//
//  HotelsVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 10.10.2022.
//

import UIKit

class HotelsVC: UIViewController {
   
    @IBOutlet weak var hotelView: UIView!
    
    var nameArray = [String]()
    var cityArray = [String]()
   
    @IBOutlet weak var hotelsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotelsTable.delegate = self
        hotelsTable.dataSource = self
        hotelsTable.separatorStyle = .none
        
        globalDelegate.shared.parsedHotels?.hotels.forEach({ hotel in
            nameArray.append(hotel.name)
            cityArray.append(hotel.city)
        })
        
    }
    
    @IBAction func returnPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
    
}

extension HotelsVC: UITableViewDelegate{
    
}

extension HotelsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = hotelsTable.dequeueReusableCell(withIdentifier: "hotelResultCell", for: indexPath) as! HotelsCell
        
        cell.hotelsDescription.textColor = UIColor(red: 0.988, green: 0.989, blue: 0.992, alpha: 1)
        cell.hotelsDescription.font = UIFont(name: "SourceSansPro-Regular", size: 18)
        cell.hotelsDescription.text = cityArray[indexPath.row]
        
        cell.hotelsName.textColor = UIColor(red: 0.988, green: 0.989, blue: 0.992, alpha: 1)
        cell.hotelsName.font = UIFont(name: "SourceSansPro-Bold", size: 25)
        cell.hotelsName.text = nameArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "hotelDetail") as! HotelDetailsVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
        vc.descriptionLabel.text = "Would you like to stay at \(nameArray[indexPath.row]) / \(cityArray[indexPath.row])"
        vc.titleLabel.text = "\(cityArray[indexPath.row])"
        vc.x = 0
    }
    
    
}
