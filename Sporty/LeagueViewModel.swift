//
//  LeagueCellViewModel.swift
//  Sporty
//
//  Created by Menna Ihab on 23/05/2023.
//

import Foundation

class LeagueViewModel {
    let apiService:ApiServiceProtocol = ApiService()
    //initial false until change when try to get data from api
    var isLoading: Bool = false {
        didSet {
            updateIndicatorClosure?()
        }
    }
    var leaguesArray : [LeagueViewModelCell] = []
    var filteredArray :[LeagueViewModelCell] = []
    
    var numberOfCells: Int = 0 {
        
        didSet {
            reloadTableViewClosure?()
            //            for item in leaguesArray{
            //                var name = item.name
            //                leaguesNames?.append(name!)
            //
        }
        
    }
    
    
    //closures
    var updateIndicatorClosure: (()->())?
    var  reloadTableViewClosure: (()->())?
  
    func getLeaguesFromApi<T>(type:T.Type)
    where T : Leagues
    {
        self.isLoading = true
        apiService.getLeaguesFromApi(compilationHandler: { [weak self] (result, error ) in
            self?.isLoading = true
            if let error = error{
                print(error)
                //    self?.alertMessage = error.rawValue
            }
            else{
                self?.addResultsToArray(leagues: result!)
            }
            
        }, type: type)
    }
    
    
    func addResultsToArray(leagues:[Leagues]){
    
        if(leagues is [FootballLeagues])
        {
            let castedLeagues = leagues as! [FootballLeagues]
            for item in castedLeagues{
                var league = LeagueViewModelCell()
                league.id = item.id
                league.name = item.name
                league.logo = item.logo
                leaguesArray.append(league)
            }
        }
               
        else {
         
            for item in leagues{
                var league = LeagueViewModelCell()
                league.id = item.id
                league.name = item.name
                print(item)
                leaguesArray.append(league)
            }
            
        }
        
       
            
        
        isLoading = false
        filteredArray = leaguesArray
        numberOfCells = filteredArray.count
        print(numberOfCells)
        
    }
  
   
    func getResultSearch(searchedText:String){
        
        filteredArray = searchedText.isEmpty||searchedText == "" ? leaguesArray : leaguesArray.filter{
            $0.name?.range(of: searchedText, options: .caseInsensitive) != nil
        }
        numberOfCells = filteredArray.count
    }
}


struct LeagueViewModelCell{
    var id: Int?
    var name :String?
    var logo:String?
}





