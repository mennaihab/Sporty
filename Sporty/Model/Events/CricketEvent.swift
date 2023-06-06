//
//  CricketEvent.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//

import Foundation

struct CricketEvent:Event{
    static let NowPlayingUrl = "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=\(key)&from=2023-05-09&to=2024-06-05&"
    
    static let LatestUrl = "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=\(key)&from=2021-03-13&"
    
    
    let date: String?
    
    let time: String?
    
    let firstTeam: String?
    
    let secondTeam: String?
    
    let firstTemaLogo: String?
    
    let secondTeamLogo: String?
    
    let gameResult: String?
    
    let  event_away_final_result:String?
    
    

    
    enum CodingKeys:String,CodingKey{
        case date = "event_date_start"
        
        case time = "event_time"
        
        case firstTeam = "event_home_team"
        
        case secondTeam = "event_away_team"
        
        case firstTemaLogo = "event_home_team_logo"
        
        case secondTeamLogo = "event_away_team_logo"
        
        case gameResult = "event_home_final_result"
        case event_away_final_result = "event_away_final_result"
        
        
    }
}
