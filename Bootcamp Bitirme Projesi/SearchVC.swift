//
//  SearchVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 28.09.2022.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var magnifyImage: UIImageView!
    
    @IBOutlet weak var searchBarButton: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
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
}


    

