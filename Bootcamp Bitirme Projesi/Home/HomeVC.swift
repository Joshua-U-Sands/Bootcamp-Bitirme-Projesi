//
//  ViewController.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 28.09.2022.
//

import UIKit

class HomeVC: UIViewController {
    
    var imageChosen = [String]()
    var imageArray = ["Image_1","Image_2","Image_3","Image_4","Image_5","Image_6","Image_7","Image_8","Image_9","Image_10",]
    var count = 0
    var randomCity = [String]()
    var randomFlight = [String]()
    var cityArray = [String]()
    var randomNumberArray = [Int]()
    var cellCount = 0
    
    var flightArray = [String]()
    
    //Views
    @IBOutlet weak var topPickTitle: UILabel!
    
    @IBOutlet weak var tabBar: UIView!
    @IBOutlet weak var homeBarView: UIView!
    @IBOutlet weak var homeImageview: UIImageView!
    
    @IBOutlet weak var flightsButton: UIButton!
    @IBOutlet weak var hotelsButton: UIButton!
   
    @IBOutlet weak var topPickCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){ [self] in
            self.topPickCollection.reloadData()
        }
        
        topPickTitle.font = UIFont(name: "SourceSansPro-SemiBold", size: 20)
        topPickTitle.textColor = UIColor(red: 0.16, green: 0.171, blue: 0.24, alpha: 1)
        
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
        
        parseJSON()
        parseFlight()
        parseCities()
        
        globalDelegate.shared.parsedCitites?.cities.forEach({ city in
            cityArray.append(city.city)
            
        })
        
        globalDelegate.shared.parsedFlights?.data.forEach({ flight in
            flightArray.append(flight.PlaceName)
        })
        
        while count < 10{
            randomCity.append(cityArray.randomElement()!)
            imageChosen.append(imageArray.randomElement()!)
            randomFlight.append(flightArray.randomElement()!)
            getRandomNumber()
            count += 1
        }
        
        
        print("RandomNumber: \(randomNumberArray)")
    }
    // Function(s)
    
    func getRandomNumber(){
        let randomNumber = Int.random(in: 1..<3)
        randomNumberArray.append(randomNumber)
    }

// Button functions
    
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
    
    @IBAction func flightsButtonPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "flightsVC") as! FlightsVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
    
    @IBAction func hotelsPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "hotelsVC") as! HotelsVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
    
    
    
}

//Extensions

extension HomeVC: UICollectionViewDelegate{
    
}

extension HomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomCity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = topPickCollection.dequeueReusableCell(withReuseIdentifier: "customCollectionCell", for: indexPath) as! topPickCell
        
        cell.topPickCategory.font = UIFont(name: "SourceSansPro-Bold", size: 14)
        cell.topPickCategory.textColor = UIColor(red: 0, green: 0.282, blue: 0.941, alpha: 1)
        
        
        cell.topPickDescription.font = UIFont(name: "SourceSansPro-Bold", size: 18)
        cell.topPickDescription.textColor = UIColor(red: 0.096, green: 0.103, blue: 0.144, alpha: 1)
        
        
        cell.topPickImage.image = UIImage(named: imageChosen[indexPath.row])
        cell.topPickImage.contentMode = .scaleToFill
        
        switch randomNumberArray[indexPath.row] {
        case 1:
            cell.topPickCategory.text = "City"
            cell.topPickDescription.text = randomCity[indexPath.row]
        case 2:
            cell.topPickCategory.text = "Flights"
            cell.topPickDescription.text = randomFlight[indexPath.row]
        default:
            ()
        }
        
        return cell
    }
    
}

