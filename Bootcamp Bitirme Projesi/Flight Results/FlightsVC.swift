//
//  FlightsVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 10.10.2022.
//

import UIKit

class FlightsVC: UIViewController {
    
    var countryNames = [String]()
    var placeNames = [String]()
    
    @IBOutlet weak var flightsTable: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flightsTable.dataSource = self
        flightsTable.delegate = self
        flightsTable.separatorStyle = .none
        
        globalDelegate.shared.parsedFlights?.data.forEach({ flight in
            countryNames.append(flight.CountryName)
            placeNames.append(flight.PlaceName)
        })
        print("Countries: \(countryNames)")
        print("Cities: \(placeNames)")
        
    }
   
    @IBAction func returnButtonPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
    
}

extension FlightsVC: UITableViewDelegate{
    
}

extension FlightsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = flightsTable.dequeueReusableCell(withIdentifier: "flightResultCell", for: indexPath) as! FlightsCell
        
        
        cell.flightDescription.textColor = UIColor(red: 0.988, green: 0.989, blue: 0.992, alpha: 1)
        cell.flightDescription.font = UIFont(name: "SourceSansPro-Regular", size: 18)
        cell.flightDescription.text = countryNames[indexPath.row]
        
        cell.flightName.textColor = UIColor(red: 0.988, green: 0.989, blue: 0.992, alpha: 1)
        cell.flightName.font = UIFont(name: "SourceSansPro-Bold", size: 25)
        cell.flightName.text = placeNames[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "hotelDetail") as! HotelDetailsVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
        
        vc.titleLabel.text = "\(countryNames[indexPath.row])"
        vc.descriptionLabel.text = "Ever wanted to fly to \(countryNames[indexPath.row])? Take a look at the \(placeNames[indexPath.row]) flight."
        vc.x = 1
    }
    
}
