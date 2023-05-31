//
//  FootballEvent.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//

import Foundation

struct FootballEvent:Event{
    static let NowPlayingUrl = "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=\(key)&from=2023-05-09&to=2024-06-05&"
    
    static let LatestUrl = "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=\(key)&from=2022-05-18&"
    
    let date: String?
    
    let time: String?
    
    let firstTeam: String?
    
    let secondTeam: String?
    
    let firstTemaLogo: String?
    
    let secondTeamLogo: String?
    
    let gameResult: String?

    
    enum CodingKeys:String,CodingKey{
        case date = "event_date"
        
        case time = "event_time"
        
        case firstTeam = "event_home_team"
        
        case secondTeam = "event_away_team"
        
        case firstTemaLogo = "home_team_logo"
        
        case secondTeamLogo = "away_team_logo"
        
        case gameResult = "event_final_result"
        
        
    }
    
}
