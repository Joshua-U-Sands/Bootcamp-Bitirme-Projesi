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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Bar Edit
        homeBarView.layer.cornerRadius = homeBarView.frame.size.height / 2
        homeBarView.backgroundColor = UIColor.orange
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

