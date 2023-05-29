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
                league.name = item.name
                league.logo = item.logo
                if(item.logo == nil)
                {
                    league.logo = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Ffootball%2F&psig=AOvVaw0ZmhzCWWUmEtKOSHvHMiKS&ust=1685470805139000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCMjCzYPlmv8CFQAAAAAdAAAAABAE"
                }
                print(item)
                leaguesArray.append(league)
                
            }
        }
        else if (leagues is [BasketballLeagues]) {
            let castedLeagues = leagues as! [BasketballLeagues]
            for item in leagues{
                var league = LeagueViewModelCell()
                league.name = item.name
                league.logo = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fstock.adobe.com%2Fsearch%3Fk%3Dbasketball&psig=AOvVaw3iZNWMqRHCRfHsDcJtv38Z&ust=1685470979953000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCLCt4cXlmv8CFQAAAAAdAAAAABAE"
                print(item)
                leaguesArray.append(league)
            }
            
        }
        
        else if (leagues is [CricketLeagues]) {
            let castedLeagues = leagues as! [BasketballLeagues]
            for item in leagues{
                var league = LeagueViewModelCell()
                league.name = item.name
                league.logo = "https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F85%2Fb9%2Fb4%2F85b9b4605207163aeacdaf78aa30ecb1.jpg&tbnid=FncOf2gfLoxfmM&vet=12ahUKEwi5vpOck5v_AhV1pkwKHf4xB0cQMygOegUIARCRAg..i&imgrefurl=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F437623288797393473%2F&docid=1CyFHyuBGHVjxM&w=1600&h=1200&q=cricket%20image&client=safari&ved=2ahUKEwi5vpOck5v_AhV1pkwKHf4xB0cQMygOegUIARCRAg"
                leaguesArray.append(league)
            }
        }
            
            else{
                let castedLeagues = leagues as! [TennisLeagues]
                for item in leagues{
                    var league = LeagueViewModelCell()
                    league.name = item.name
                    league.logo = "https://www.google.com/imgres?imgurl=https%3A%2F%2Fstatic.vecteezy.com%2Fsystem%2Fresources%2Fpreviews%2F006%2F044%2F496%2Foriginal%2Fset-of-tennis-logos-emblems-badges-labels-and-design-elements-free-vector.jpg&tbnid=BGyqh31fgI5SOM&vet=12ahUKEwihyZC2k5v_AhUqmicCHRzVAAMQMygFegUIARD9AQ..i&imgrefurl=https%3A%2F%2Fwww.vecteezy.com%2Ffree-vector%2Ftennis-logo&docid=WdN0l5bHR4D9AM&w=1920&h=1920&q=tennis%20image&client=safari&ved=2ahUKEwihyZC2k5v_AhUqmicCHRzVAAMQMygFegUIARD9AQ"
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
    var name :String?
    var logo:String?
}





