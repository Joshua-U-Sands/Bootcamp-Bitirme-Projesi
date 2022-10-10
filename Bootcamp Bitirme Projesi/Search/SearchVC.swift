//
//  SearchVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 28.09.2022.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchResultTable: UITableView!
    @IBOutlet weak var hotelsButton: UIButton!
    @IBOutlet weak var flightsButton: UIButton!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var magnifyImage: UIImageView!
    
    @IBOutlet weak var searchBarButton: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchLabel.font = UIFont(name: "SourceSansPro-Bold", size: 30)
        
        searchResultTable.delegate = self
        searchResultTable.dataSource = self
        searchResultTable.separatorStyle = .none
        
        searchBarView.frame = CGRect(x: 0, y: 0, width: 358, height: 48)
        searchBarView.backgroundColor = .white
        searchBarView.layer.cornerRadius = 4
        searchBarView.layer.borderWidth = 1.8
        searchBarView.layer.borderColor = UIColor(red: 0.88, green: 0.886, blue: 0.92, alpha: 1).cgColor
        
        magnifyImage.tintColor = UIColor(red: 1, green: 0.4, blue: 0.48, alpha: 1)
        
        //Bar Edit
        searchBarButton.layer.cornerRadius = searchBarButton.frame.height / 2
        searchBarButton.backgroundColor = UIColor.orange
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    
        
        
        
        
        
        
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    //NAVIGATION BUTTONS
    @IBAction func homePressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: false)
    }
    
    @IBAction func bookmarkPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "bookmarkVC") as! BookmarkVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: false)
    }
    
    //SELECTION BUTTONS
    @IBAction func hotelsSelected(_ sender: UIButton) {
        
        hotelsButton.setImage(UIImage(named: "HotelsSelected"), for: .normal)
        flightsButton.setImage(UIImage(named: "FlightsUnselected"), for: .normal)
        searchField.text = ""
        searchField.placeholder = "Where to next?"
        searchField.endEditing(true)
    }
    
    @IBAction func flightsSelected(_ sender: UIButton) {
        hotelsButton.setImage(UIImage(named: "HotelsUnselected"), for: .normal)
        flightsButton.setImage(UIImage(named: "FlightsSelected"), for: .normal)
        searchField.text = ""
        searchField.placeholder = "View flight number"
        searchField.endEditing(true)
    }
}

extension SearchVC: UITableViewDelegate{
    
}

extension SearchVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResultTable.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! SearchResultCell
        
        cell.searchResultImage.image = UIImage(named: "testCity")
        cell.searchResultCity.textColor = UIColor(red: 0.988, green: 0.989, blue: 0.992, alpha: 1)
        cell.searchResultCity.font = UIFont(name: "SourceSansPro-Regular", size: 18)
        cell.searchResultCity.text = "Singapure"
        
        cell.searchResultName.textColor = UIColor(red: 0.988, green: 0.989, blue: 0.992, alpha: 1)
        cell.searchResultName.font = UIFont(name: "SourceSansPro-Bold", size: 25)
        cell.searchResultName.text = "Marina Bay"
        
        return cell
    }
    
    
}



    

