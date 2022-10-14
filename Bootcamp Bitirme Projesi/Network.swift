//
//  Network.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 8.10.2022.
//

import Foundation

//Hotel

class ParsedHotels: Codable{
    var hotels: [hotels]
    
}

class hotels: Codable{
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



//Flight

struct ParsedFlights: Codable{
    var data : [data]
}

struct data: Codable{
    var PlaceName : String
    var CountryName : String
}

func parseFlight(){
    
    if let path = Bundle.main.path(forResource: "flightData", ofType: "json"){
        let url = URL(fileURLWithPath: path)
        var result: ParsedFlights?
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(ParsedFlights.self, from: jsonData)
            if let result = result{
                globalDelegate.shared.parsedFlights = result
            }else{
                print("Parsed Hotel")
            }
        }catch{
            print("Error catched")
        }
    }
    
}

// Top pick random city

struct ParsedCities: Codable{
    var cities: [cities]
}

struct cities: Codable{
    var city: String
}

func parseCities(){
    
    if let path = Bundle.main.path(forResource: "cityData", ofType: "json"){
        let url = URL(fileURLWithPath: path)
        var result: ParsedCities?
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(ParsedCities.self, from: jsonData)
            if let result = result{
                globalDelegate.shared.parsedCitites = result
            }else{
                print("Parsed Hotel")
            }
        }catch{
            print("Error catched")
        }
    }
    
}
    
class globalDelegate{
    static let shared = globalDelegate()
    var parsedHotels: ParsedHotels?
    var parsedFlights: ParsedFlights?
    var parsedCitites: ParsedCities?
}
