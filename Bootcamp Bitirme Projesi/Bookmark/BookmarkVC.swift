//
//  BookmarkVC.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 28.09.2022.
//

import UIKit

class BookmarkVC: UIViewController {

    @IBOutlet weak var bookmarkBarView: UIView!
    
    @IBOutlet weak var bookmarkTitle: UILabel!
    @IBOutlet weak var bookmarkTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Table Design
        bookmarkTable.dataSource = self
        bookmarkTable.delegate = self
        bookmarkTable.separatorStyle = .none
        bookmarkTitle.textColor = UIColor(red: 0.16, green: 0.171, blue: 0.24, alpha: 1)
        bookmarkTitle.font = UIFont(name: "SourceSansPro-Bold", size: 30)
        
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

extension BookmarkVC: UITableViewDelegate{
    
}

extension BookmarkVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = bookmarkTable.dequeueReusableCell(withIdentifier: "bookmarkCell", for: indexPath) as! BookmarkCell
        
        cell.bookmarkName.textColor = UIColor(red: 0.988, green: 0.989, blue: 0.992, alpha: 1)
        cell.bookmarkName.font = UIFont(name: "SourceSansPro-Bold", size: 25)
        cell.bookmarkName.text = "Name"
        
        cell.bookmarkDesc.textColor = UIColor(red: 0.988, green: 0.989, blue: 0.992, alpha: 1)
        cell.bookmarkDesc.font = UIFont(name: "SourceSansPro-Regular", size: 18)
        cell.bookmarkDesc.text = "Description"
        
        return cell
    }
    
    
}
