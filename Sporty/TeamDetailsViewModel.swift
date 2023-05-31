//
//  TeamDetailsViewModel.swift
//  Sporty
//
//  Created by Menna Ihab on 30/05/2023.
//

import Foundation
import CoreData

class TeamDetailsViewModel{
    
    let apiService:ApiServiceProtocol = ApiService()
    //initial false until change when try to get data from api
    var isLoading: Bool = false {
        didSet {
            updateIndicatorClosure?()
        }
    }
    var teamArray :[playerViewModelCell] = []
    var teamName :String?
    var teamLogo:String?
    var teamId:Int?
    var numberOfCells: Int = 0 {
        
        didSet {
            reloadTableViewClosure?()
        }
        
    }
    
    
    //closures
    var updateIndicatorClosure: (()->())?
    var  reloadTableViewClosure: (()->())?
    
    func getTeamdetailsFromApi<T>(type:T.Type,teamId:Int)
    where T : Team
    {
        self.isLoading = true
        apiService.getTeamDetailsFromApi(compilationHandler: { [weak self] (result, error ) in
            self?.isLoading = true
            if let error = error{
                print(error)
                //    self?.alertMessage = error.rawValue
            }
            else{
                self?.addResultsToArray(teams: result!)
            }
            
        }, type: type,teamId:teamId)
    }
    
    
    func addResultsToArray(teams:[Team]){
        
        
        var team = TeamViewModelCell()
        if(teams is [FootballTeam])
        {
            let castedArray = teams as! [FootballTeam]
            
            for item in castedArray{
                team.id = item.id
                team.name = item.name
                team.logo = item.logo
                // team.players = (item.players as! [playerViewModelCell])
                var player :playerViewModelCell?
                for p in item.players{
                    player = playerViewModelCell()
                    player?.player_name = p.player_name
                    // print(p.player_name)
                    player?.player_age = p.player_age
                    player?.player_type = p.player_type
                    player?.player_image = p.player_image
                    print(player)//data
                    team.players.append(player!) //1
                    print(team.players.count)
                }
            }
        }
        
        else {
            
            for item in teams{
                
                team.id = item.id
                team.name = item.name
                team.logo = item.logo
                
            }
        }
        teamId = team.id
        teamName = team.name
        teamLogo = team.logo
        teamArray = team.players
        isLoading = false
        numberOfCells = team.players.count
        print(numberOfCells)
        
    }
    
    
    func addToFavourites(context: NSManagedObjectContext,sportType:String){
        let entity = NSEntityDescription.entity(forEntityName: "TeamData", in: context)
        let team = NSManagedObject(entity: entity!, insertInto: context)
        
        team.setValue(teamId, forKey: "teamId")
        team.setValue(teamLogo, forKey: "teamLogo")
        team.setValue(teamName, forKey: "teamName")
        team.setValue(sportType, forKey: "sportType")
        do{
            try context.save()
            
        }
        catch let error as NSError{
            print(error.localizedDescription)
        }
        
        
        
    }
    
}


struct TeamViewModelCell{
    
    var id :Int?
    var name :String?
    var logo:String?
    var players:[playerViewModelCell] = []
 
}


struct playerViewModelCell{
    
    var player_name:String?
    var player_image:String?
    var player_age:String?
    var player_type:String?
    
}
    
  


    
    
    
    
    
    

