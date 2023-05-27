//
//  FootballTeam.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//

import Foundation

struct FootballTeam:Team{
    static let url: String = "https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=\(key)&leagueId=\(leagueId!)"
    
    let id: Int?
    
    let name: String?
    
    let logo: String?
    
    let players:[player]
    
    
    enum CodingKeys:String,CodingKey{
        case id = "team_key"
        case name = "team_name"
        case logo = "team_logo"
        case players = "players"
        
    }
    
    
}

struct player:Decodable{
    
    let player_name:String?
    let player_image:String?
    let player_age:String?
    let player_type:String?
    
    
    
}
