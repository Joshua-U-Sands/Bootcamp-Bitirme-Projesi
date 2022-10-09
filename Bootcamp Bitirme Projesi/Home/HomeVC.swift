//
//  ViewController.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 28.09.2022.
//

import UIKit

class HomeVC: UIViewController {

    //Views
    @IBOutlet weak var tabBar: UIView!
    @IBOutlet weak var homeBarView: UIView!
    @IBOutlet weak var homeImageview: UIImageView!
    
    @IBOutlet weak var flightsButton: UIButton!
    @IBOutlet weak var hotelsButton: UIButton!
   
    @IBOutlet weak var topPickCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadHotels()
        
        topPickCollection.isUserInteractionEnabled = true
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        //Bar Edit
        homeBarView.layer.cornerRadius = homeBarView.frame.size.height / 2
        homeBarView.backgroundColor = UIColor.orange
        
        topPickCollection.dataSource = self
        topPickCollection.delegate = self
        
       

        topPickCollection.layer.shadowColor = UIColor(red: 0.094, green: 0.196, blue: 0.451, alpha: 0.1).cgColor

        topPickCollection.layer.shadowOpacity = 1

        topPickCollection.layer.shadowRadius = 16

        topPickCollection.layer.shadowOffset = CGSize(width: 2, height: 8)

        
        topPickCollection.layer.shadowColor = UIColor(red: 0.094, green: 0.196, blue: 0.451, alpha: 0.1).cgColor

        topPickCollection.layer.shadowOpacity = 1

        topPickCollection.layer.shadowRadius = 16

        topPickCollection.layer.shadowOffset = CGSize(width: 2, height: 8)
    }
    
//    func customTabBar(){
//        bookmarkBarView.layer.cornerRadius = bookmarkBarView.frame.height / 2
//        bookmarkBarView.backgroundColor = UIColor.orange
//    }
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "searchVC") as! SearchVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: false)
    }
    
    @IBAction func bookmarkPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "bookmarkVC") as! BookmarkVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: false)
    }
    
}

extension HomeVC: UICollectionViewDelegate{
    
}

extension HomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = topPickCollection.dequeueReusableCell(withReuseIdentifier: "customCollectionCell", for: indexPath)
        return cell
        
    }
    
    
}

