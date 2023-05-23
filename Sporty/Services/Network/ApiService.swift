//
//  ApiService.swift
//  Sporty
//
//  Created by Menna Ihab on 22/05/2023.
//

import Foundation

enum ApiError:String{
    case error = "Check your Internet Connection"
}
let key = "081870b59e506f9793c1fcc7cb85b7117abcee183700e44ddcc5273587f2af8f"
let basketballLeagues = "https://apiv2.allsportsapi.com/basketball/?met=Leagues&\(key)"
let cricketLeagues =  "https://apiv2.allsportsapi.com/cricket/?met=Leagues&\(key)"
let footballLeagues = "https://apiv2.allsportsapi.com/football/?met=Leagues&\(key)"
let tennisLeagues =  "https://apiv2.allsportsapi.com/tennis/?met=Leagues&\(key)"


protocol ApiServiceProtocol{
    func getFootballLeaguesFromApi(compilationHandler:@escaping(FootballLeaguesJsonResult?,ApiError?)->())
    
    func getLeaguesFromApi(compilationHandler:@escaping(LeaguesJsonResult?,ApiError?)->(),sportKind:String)
    
}
class ApiService:ApiServiceProtocol{
    
    func getFootballLeaguesFromApi(compilationHandler:@escaping(FootballLeaguesJsonResult?,ApiError?)->()){
        //url obj
       
            let url = URL(string:"https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=081870b59e506f9793c1fcc7cb85b7117abcee183700e44ddcc5273587f2af8f")
        
        //if i want to make post/get ,mofify it from request
        let request = URLRequest(url: url!)
        //open session for http request
        let session = URLSession(configuration: URLSessionConfiguration.default)
        //begin closure for request
        let task = session.dataTask(with: request){
            data,response,error in
            do{
                if let data = data{
            
                  
                        let result = try JSONDecoder().decode(FootballLeaguesJsonResult.self, from: data)
                   
                    compilationHandler(result,nil)
                    
                }
            }
            catch{
                
                print("error in parsing data")
                compilationHandler(nil,ApiError.error)
            }
        }
        task.resume()
    }
    
    
    func getLeaguesFromApi(compilationHandler:@escaping(LeaguesJsonResult?,ApiError?)->(),sportKind:String){
        //url obj
        let url:URL?
       if(sportKind == "basketball")
        {
           url = URL(string:basketballLeagues)
            
        }
        else if(sportKind == "cricket"){
          url = URL(string:cricketLeagues)
        }
        else{
           url = URL(string:tennisLeagues)
        }
        
        //if i want to make post/get ,mofify it from request
        let request = URLRequest(url: url!)
        //open session for http request
        let session = URLSession(configuration: URLSessionConfiguration.default)
        //begin closure for request
        let task = session.dataTask(with: request){
            data,response,error in
            do{
                if let data = data{
                 
                        let result = try JSONDecoder().decode(LeaguesJsonResult.self, from: data)
                
                   
                    compilationHandler(result,nil)
                    
                }
            }
            catch{
                
                print("error in parsing data")
                compilationHandler(nil,ApiError.error)
            }
        }
        task.resume()
    }
    
}
        

