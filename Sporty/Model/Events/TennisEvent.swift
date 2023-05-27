//
//  TennisEvent.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//

import Foundation

struct TennisEvent:Event{
    
    static let NowPlayingUrl = "https://apiv2.allsportsapi.com/tennis/?met=Livescore&APIkey=\(key)&leagueId=\(leagueId!)"
    
    static let LatestUrl = "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=\(key)&from=2021-06-17&to=\(currentDate!)&leagueId=\(leagueId!)"
    
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
        
        case firstTeam = "event_first_player"
        
        case secondTeam = "event_second_player"
        
        case firstTemaLogo = "event_first_player_logo"
        
        case secondTeamLogo = "event_second_player_logo"
        
        case gameResult = "event_final_result"
        
        
    }
}
