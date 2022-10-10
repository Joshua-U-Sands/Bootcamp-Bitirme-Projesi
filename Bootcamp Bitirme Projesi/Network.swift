//
//  Network.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 8.10.2022.
//

import Foundation

class ParsedHotels: Decodable{
    var hotels: [hotels]
    
}

class hotels: Decodable{
    var name: String
    var city: String
    
    
}


     func parseJSON(){
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json"){
            
            let url = URL(fileURLWithPath: path)
            var result: ParsedHotels?
            do {
                let jsonData = try Data(contentsOf: url)
                result = try JSONDecoder().decode(ParsedHotels.self, from: jsonData)
                if let result = result{
                    globalDelegate.shared.parsedHotels = result
                }else{
                    print("Parse error")
                }
            }
            catch{
                print("Error: \(error)")
            }
        }
        
    }

class globalDelegate{
    static let shared = globalDelegate()
    var parsedHotels: ParsedHotels?
}





 
    
    

