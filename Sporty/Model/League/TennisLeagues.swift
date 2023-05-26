//
//  TennisLeagues.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//

import Foundation
struct TennisLeagues:Leagues{
    static var url: String = "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=\(key)"
    
    var id: Int
    var name: String
    
    
    enum CodingKeys:String,CodingKey{
        case id = "league_key"
        case name = "league_name"
        
        
    }
}
