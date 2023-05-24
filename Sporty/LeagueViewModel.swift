//
//  LeagueCellViewModel.swift
//  Sporty
//
//  Created by Menna Ihab on 23/05/2023.
//

import Foundation

class LeagueViewModel {
    let apiService:ApiServiceProtocol = ApiService()
    
   // var leaguesNames:[String]?
    
    
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
    
    
    func getFootballLeaguesFromApi () {
        self.isLoading = true
        apiService.getFootballLeaguesFromApi { [weak self] (result, error )in
            self?.isLoading = true
            if let error = error{
                print(error)
                //    self?.alertMessage = error.rawValue
            }
            else{
                print("data from api")
                print(result?.result?[0].name)
                self?.addFootballResultsToArray(leagues: result!)
            }
        }
        
    }
    
    func addFootballResultsToArray(leagues: FootballLeaguesJsonResult){
        for item in leagues.result!{
            var league = LeagueViewModelCell()
            league.name = item.name
            if(item.logo != ""){
                league.logo = item.logo
            }
            else{
                item.logo = "//"
            }
            print(item)
            leaguesArray.append(league)
            
            print(item.name)
        }
        isLoading = false
        filteredArray = leaguesArray
        numberOfCells = filteredArray.count
        print(numberOfCells)
        
        
    }
    
    
    func getLeaguesFromApi (sportKind:String) {
        self.isLoading = true
        
        apiService.getLeaguesFromApi(compilationHandler:
                                        { [weak self] (result, error )in
            self?.isLoading = true
            if let error = error{
                print(error)
                //    self?.alertMessage = error.rawValue
            }
            else{
                print("data from api")
                print(result?.result?[0].name)
                self?.addResultsToArray(leagues: result!,sportKind: sportKind)
            }
        }, sportKind: sportKind)
    }
    
    private func addResultsToArray(leagues:LeaguesJsonResult,sportKind:String){
        
        for item in leagues.result!{
            var league = LeagueViewModelCell()
            if(sportKind == "basketball"){
                
                league.name = item.name
                league.logo = "//"
            }
            else if(sportKind == "cricket"){
                
                league.name = item.name
                league.logo = "//"
            }
            
            else{
                
                league.name = item.name
                league.logo = "//"
            }
            print(item)
            leaguesArray.append(league)
            
            print(item.name)
        }
        numberOfCells = leaguesArray.count
        print(numberOfCells)
        
    }
    
    
    func getResultSearch(searchedText:String){
        
       filteredArray = searchedText.isEmpty||searchedText == "" ? leaguesArray : leaguesArray.filter{
            $0.name?.range(of: searchedText, options: .caseInsensitive) != nil
        }
        numberOfCells = filteredArray.count
    }
}
    
    //func getCellViewModel( at indexPath: IndexPath ) -> PhotoListCellViewModel {
      //  return cellViewModels[indexPath.row]
    //}
    
  
    struct LeagueViewModelCell{
        var name :String?
        var logo:String?
    }

    
    
    

