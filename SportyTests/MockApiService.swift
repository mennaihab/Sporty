//
//  MockApiService.swift
//  SportyTests
//
//  Created by Menna Ihab on 01/06/2023.
//

import Foundation
@testable import Sporty

class MockApiService{
    var shouldReturnError: Bool
    init(shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    enum ApiError:String{
        case error = "Check your Internet Connection"
    }
    
    
    
    let mockLeagueResponse : String =
    """
    {
      "success": 1,
      "result": [
        {
          "league_key": 4,
          "league_name": "UEFA Europa League",
          "country_key": 1,
          "country_name": "eurocups",
          "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/",
          "country_logo": null
        },
        {
          "league_key": 1,
          "league_name": "European Championship",
          "country_key": 1,
          "country_name": "eurocups",
          "league_logo": null,
          "country_logo": null
        }]
}
"""
    
    
    let mockLatestEventResponse : String =
"""
{
  "success": 1,
  "result": [
    {
      "league_key": 4,
      "league_name": "UEFA Europa League",
      "country_key": 1,
      "country_name": "eurocups",
      "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/",
      "country_logo": null
    },
    {
      "league_key": 1,
      "league_name": "European Championship",
      "country_key": 1,
      "country_name": "eurocups",
      "league_logo": null,
      "country_logo": null
    }]
}
"""
    
    
    let mockUpcomingResponse : String =
"""
{
  "success": 1,
  "result": [
    {
      "league_key": 4,
      "league_name": "UEFA Europa League",
      "country_key": 1,
      "country_name": "eurocups",
      "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/",
      "country_logo": null
    },
    {
      "league_key": 1,
      "league_name": "European Championship",
      "country_key": 1,
      "country_name": "eurocups",
      "league_logo": null,
      "country_logo": null
    }]
}
"""
    
    
    let mockTeamsResponse : String =
"""
{
  "success": 1,
  "result": [
    {
      "team_key": 1,
      "team_name": "Los Angeles Lakers",
      "team_logo": "https://apiv2.allsportsapi.com/logo-basketball/1_los_angeles_lakers.jpg"
    },
    {
      "team_key": 2,
      "team_name": "Brooklyn Nets",
      "team_logo": "https://apiv2.allsportsapi.com/logo-basketball/2_brooklyn_nets.jpg"
    },
    {
      "team_key": 3,
      "team_name": "Toronto Raptors",
      "team_logo": "https://apiv2.allsportsapi.com/logo-basketball/3_toronto_raptors.jpg"
    },
    {
      "team_key": 4,
      "team_name": "Philadelphia 76ers",
      "team_logo": "https://apiv2.allsportsapi.com/logo-basketball/4_philadelphia_76ers.jpg"
    }]
}
"""
    
    
    let mockTeamDetailsResponse : String =
    """
    {
      "success": 1,
      "result":[
        {
          "team_key": 1,
          "team_name": "Los Angeles Lakers",
          "team_logo": "https://apiv2.allsportsapi.com/logo-basketball/1_los_angeles_lakers.jpg"
        }
]
}
"""
    
}


extension MockApiService : ApiServiceProtocol{
    func getTennisPlayersFromApi(compilationHandler: @escaping ([Sporty.TennisPlayers]?, Sporty.ApiError?) -> (), leagId: Int) {
      
    }
    

    
 
    
    
    
    func getLatestEventsFromApi<T>(compilationHandler: @escaping ([T]?, Sporty.ApiError?) -> (), type: T.Type, leagId: Int) where T : Sporty.Event {
        if shouldReturnError{
            compilationHandler(nil, Sporty.ApiError.error)
        }else{
            do{
                let mockData = mockLatestEventResponse.data(using: .utf8)
                let result = try JSONDecoder().decode(ApiResponse<T>.self, from: mockData!)
                let n = result.result
                compilationHandler(result.result, nil)
            }catch let error{
                compilationHandler(nil,Sporty.ApiError.error)
            }
        }
    }
    
    
    
    func getUpComingEventsFromApi<T>(compilationHandler: @escaping ([T]?, Sporty.ApiError?) -> (), type: T.Type, leagId: Int) where T : Sporty.Event {
        if shouldReturnError{
            compilationHandler(nil, Sporty.ApiError.error)
        }else{
            do{
                let mockData = mockUpcomingResponse.data(using: .utf8)
                let result = try JSONDecoder().decode(ApiResponse<T>.self, from: mockData!)
                let n = result.result
                compilationHandler(result.result, nil)
            }catch let error{
                compilationHandler(nil,Sporty.ApiError.error)
            }
        }
    }
    
    
    func getTeamsFromApi<T>(compilationHandler: @escaping ([T]?, Sporty.ApiError?) -> (), type: T.Type, leagId: Int) where T : Sporty.Team {
        if shouldReturnError{
            compilationHandler(nil, Sporty.ApiError.error)
        }else{
            do{
                let mockData = mockTeamsResponse.data(using: .utf8)
                let result = try JSONDecoder().decode(ApiResponse<T>.self, from: mockData!)
                let n = result.result
                compilationHandler(result.result, nil)
            }catch let error{
                compilationHandler(nil,Sporty.ApiError.error)
            }
        }
    }
    
    
    
    func getTeamDetailsFromApi<T>(compilationHandler: @escaping ([T]?, Sporty.ApiError?) -> (), type: T.Type, teamId: Int) where T : Sporty.Team {
        if shouldReturnError{
            compilationHandler(nil, Sporty.ApiError.error)
        }else{
            do{
                let mockData = mockTeamDetailsResponse.data(using: .utf8)
                let result = try JSONDecoder().decode(ApiResponse<T>.self, from: mockData!)
                let n = result.result
                compilationHandler(result.result, nil)
            }catch let error{
                compilationHandler(nil,Sporty.ApiError.error)
            }
        }
    }
    
        
        func getLeaguesFromApi<T>(compilationHandler: @escaping ([T]?, Sporty.ApiError?) -> (), type: T.Type) where T :Sporty.Leagues{
            if shouldReturnError{
                compilationHandler(nil, Sporty.ApiError.error)
            }else{
                do{
                    let mockData = mockLeagueResponse.data(using: .utf8)
                    let result = try JSONDecoder().decode(ApiResponse<T>.self, from: mockData!)
                    let n = result.result
                    compilationHandler(result.result, nil)
                }catch let error{
                    compilationHandler(nil,Sporty.ApiError.error)
                }
            }
        }
    
}


