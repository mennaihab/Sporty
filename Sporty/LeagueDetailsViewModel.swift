//
//  LeagueDetailsViewModel.swift
//  Sporty
//
//  Created by Menna Ihab on 28/05/2023.
//

import Foundation
class LeagueDetailsViewModel
{
let apiService:ApiServiceProtocol = ApiService()

//initial false until change when try to get data from api
var isLoading: Bool = false {
    didSet {
        updateIndicatorClosure?()
    }
}
var LatestArray : [EventViewModelCell] = []
var upComingArray:[EventViewModelCell] = []
var teamsArray:[TeamsViewModelCell] = []

var numberOfLatestCells: Int = 0 {

    didSet {
        reloadLatestClosure?()
        
    }
    
}
    
    var numberOfUpComingCells: Int = 0 {

        didSet {
            reloadUpComingClosure?()
            
        }
        
    }
    
    
    var numberOfTeamsCells: Int = 0 {

        didSet {
            reloadteamsClosure?()
            
        }
        
    }
    
   


//closures
var updateIndicatorClosure: (()->())?
var  reloadUpComingClosure: (()->())?
    var  reloadLatestClosure: (()->())?
    var  reloadteamsClosure: (()->())?



    
    func getUpComingFromApi<T:Event>(type:T.Type,leagId:Int)
where T : Event
{
    self.isLoading = true
    apiService.getUpComingEventsFromApi(compilationHandler: { [weak self] (result, error ) in
       // self?.isLoading = false
        if let error = error{
            print(error)
            //    self?.alertMessage = error.rawValue
        }
        else{
            
            self?.addResultsToUpComingArray(events: result!)
        }
        
    }, type:type,leagId:leagId)
}
    
    func getLatestFromApi<T:Event>(type:T.Type,leagId:Int)
where T : Event
{
    self.isLoading = true
    apiService.getLatestEventsFromApi(compilationHandler: { [weak self] (result, error ) in
        //self?.isLoading = true
        if let error = error{
            print(error)
            //    self?.alertMessage = error.rawValue
        }
        else{
            
            self?.addResultsToLatestArray(events: result!)
        }
        
    }, type:type,leagId:leagId)
}
    
    func getTeamsFromApi<T:Team>(type:T.Type,leagId:Int)
where T : Team
{
    self.isLoading = true
    apiService.getTeamsFromApi(compilationHandler: { [weak self] (result, error ) in
       // self?.isLoading = true
        if let error = error{
            print(error)
            //    self?.alertMessage = error.rawValue
        }//
        else{
            
            self?.addResultsToTeamsArray(teams: result!)
        }
        
    }, type:type,leagId:leagId)
}


func addResultsToLatestArray(events:[Event]){

    for item in events{
        var event = EventViewModelCell()
        event.firstTeam = item.firstTeam
        event.secondTeam = item.secondTeam
        event.date = item.date
        event.time = item.time
        event.firstTemaLogo = item.firstTemaLogo
        event.secondTeamLogo = item.secondTeamLogo
        event.gameResult = item.gameResult
        LatestArray.append(event)
        print("array count")
        print(LatestArray.count)
    }
  
    isLoading = false
    numberOfLatestCells = LatestArray.count
    print("number of cells from view model")
    print(numberOfLatestCells)
    
}
    
    
    
    func addResultsToUpComingArray(events:[Event]){

        for item in events{
            var event = EventViewModelCell()
            event.firstTeam = item.firstTeam
            event.secondTeam = item.secondTeam
            event.date = item.date
            event.time = item.time
            event.firstTemaLogo = item.firstTemaLogo
            event.secondTeamLogo = item.secondTeamLogo
            event.gameResult = item.gameResult
            upComingArray.append(event)
        }
      
        isLoading = false
        numberOfUpComingCells = upComingArray.count
       // print(numberOfUpComingCells)
        
    }




func addResultsToTeamsArray(teams:[Team]){

    for item in teams{
        var team = TeamsViewModelCell()
        team.id = item.id
        team.name = item.name
        team.logo = item.logo
    
        teamsArray.append(team)
    }
  
    isLoading = false
    numberOfTeamsCells = teamsArray.count
    //print(numberOfTeamsCells)
    
}

}


struct EventViewModelCell{
    var date:String?
    var time:String?
    var firstTeam:String?
    var secondTeam:String?
    var firstTemaLogo:String?
    var secondTeamLogo:String?
    var gameResult:String?

}

struct TeamsViewModelCell{
    var id:Int?
    var name:String?
    var logo:String?
    

}

