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
var LatestArray : [LatestViewModelCell] = []
    var upComingArray:[LatestViewModelCell] = []

var numberOfCells: Int = 0 {
    
    
    didSet {
        reloadTableViewClosure?()
        
    }
    
}
    
    var numberOfUpcomingCells: Int = 0 {
        didSet {
            reloadTableViewClosure?()
            
        }
        
    }


//closures
var updateIndicatorClosure: (()->())?
var  reloadTableViewClosure: (()->())?


    func getLatestFromApi<T:Event>(type:T.Type,leagId:Int)
where T : Event
{
    self.isLoading = true
    apiService.getLatestEventsFromApi(compilationHandler: { [weak self] (result, error ) in
        self?.isLoading = true
        if let error = error{
            print(error)
            //    self?.alertMessage = error.rawValue
        }
        else{
            
            self?.addResultsToArray(events: result!)
        }
        
    }, type:type,leagId:leagId)
}

    
    func getUpComingFromApi<T:Event>(type:T.Type,leagId:Int)
where T : Event
{
    self.isLoading = true
    apiService.getNowPlayingEventsFromApi(compilationHandler: { [weak self] (result, error ) in
        self?.isLoading = true
        if let error = error{
            print(error)
            //    self?.alertMessage = error.rawValue
        }
        else{
            
            self?.addResultsToArray(events: result!)
        }
        
    }, type:type,leagId:leagId)
}


func addResultsToArray(events:[Event]){

    for item in events{
        var event = LatestViewModelCell()
        event.firstTeam = item.firstTeam
        event.secondTeam = item.secondTeam
        event.date = item.date
        event.time = item.time
        event.firstTemaLogo = item.firstTemaLogo
        event.secondTeamLogo = item.secondTeamLogo
        event.gameResult = item.gameResult
        
        
        
        if(events is [FootballEvent]){
            if event.firstTemaLogo == nil
            {
                event.firstTemaLogo = "/"
            }
            if event.secondTeamLogo == nil {
                event.firstTemaLogo = "/"
            }
            
        }
        
        if(events is [BasketballEvent])
        {
            
        }
        LatestArray.append(event)
    }
  
    isLoading = false
    numberOfCells = LatestArray.count
    print(numberOfCells)
    
}

}



struct LatestViewModelCell{
    var date:String?
    var time:String?
    var firstTeam:String?
    var secondTeam:String?
    var firstTemaLogo:String?
    var secondTeamLogo:String?
    var gameResult:String?

}

