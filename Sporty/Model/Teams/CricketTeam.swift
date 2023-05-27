//
//  CricketTeam.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//

import Foundation

struct CricketTeam:Team{
    static let url: String =
    "https://apiv2.allsportsapi.com/cricket/?&met=Teams&APIkey=\(key)&leagueId=\(leagueId!)"

    
    var id: Int?
    
    var name: String?
    
    var logo: String?
 
    
    enum CodingKeys:String,CodingKey{
        case id = "team_key"
        case name = "team_name"
        case logo = "team_logo"
        
    }
    
}
