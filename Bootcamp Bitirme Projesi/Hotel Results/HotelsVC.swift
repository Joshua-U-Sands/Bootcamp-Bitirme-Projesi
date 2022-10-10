//
//  HotelsVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 10.10.2022.
//

import UIKit

class HotelsVC: UIViewController {

    @IBOutlet weak var hotelsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotelsTable.delegate = self
        hotelsTable.dataSource = self
        hotelsTable.separatorStyle = .none
    }
    
    @IBAction func returnPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: false)
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
        
        
        cell.hotelsName.textColor = UIColor(red: 0.988, green: 0.989, blue: 0.992, alpha: 1)
        cell.hotelsName.font = UIFont(name: "SourceSansPro-Bold", size: 25)
        
        return cell
        
    }
    
    
}
