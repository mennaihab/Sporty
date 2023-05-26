//
//  FootballLeagueModel.swift
//  Sporty
//
//  Created by Menna Ihab on 23/05/2023.
//

import Foundation

struct FootballLeagues : Leagues,Decodable{
    static let url: String = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=\(key)"
    
    let id: Int
    let name: String
    let logo:String?
    
    enum CodingKeys:String,CodingKey{
        case id = "league_key"
        case name = "league_name"
        case logo = "league_logo"
        
    }
}


