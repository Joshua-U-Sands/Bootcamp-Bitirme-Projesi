//
//  BookmarkVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 28.09.2022.
//

import UIKit

class BookmarkVC: UIViewController {

    @IBOutlet weak var bookmarkBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Bar Edit
        bookmarkBarView.layer.cornerRadius = bookmarkBarView.frame.height / 2
        bookmarkBarView.backgroundColor = UIColor.orange
    }

    @IBAction func homePressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: false)
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "searchVC") as! SearchVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: false)
    }
    
}
