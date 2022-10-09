//
//  Network.swift
//  Bootcamp Bitirme Projesi
//
//  Created by Joshua Sands on 8.10.2022.
//

import Foundation
import Alamofire

struct downloadedHotels: Decodable{
    var sr : sr
}

struct sr: Decodable{
    var regionNames : regionNames
}

struct regionNames: Decodable{
    var shortName : String
}

let url = URL(string: "https://hotels4.p.rapidapi.com/locations/v3/search")

let headers : HTTPHeaders = [
    "X-RapidAPI-Key": "71bcd203bdmshd60963b7b046441p12885ejsn352784bf50fc",
    "X-RapidAPI-Host": "hotels4.p.rapidapi.com"
]

let params = ["q":"istanbul"]

func downloadHotels(){
    
    AF.request(url!, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).response { response in
        
        switch response.result {
            
        case .success:
            
            if let data = response.data {
                
               
                do {
                    let jsonResponse = try JSONDecoder().decode(downloadedHotels.self, from: data)
                    print(jsonResponse)
                }catch let error as NSError{
                    print(error)
                }
                
            }
            
        case .failure(_):
            print("af error")
        }
        
    }
    
    
    
    
}
