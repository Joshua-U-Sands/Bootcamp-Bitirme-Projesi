//
//  FlightsVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 10.10.2022.
//

import UIKit

class FlightsVC: UIViewController {

    @IBOutlet weak var flightsTable: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flightsTable.dataSource = self
        flightsTable.delegate = self
        flightsTable.separatorStyle = .none

    }
   
    @IBAction func returnButtonPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: false)
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
        
        
        cell.flightName.textColor = UIColor(red: 0.988, green: 0.989, blue: 0.992, alpha: 1)
        cell.flightName.font = UIFont(name: "SourceSansPro-Bold", size: 25)
        
        return cell
        
        
        
    }
    
    
}
