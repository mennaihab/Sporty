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

protocol ApiServiceProtocol{
    
    
    
    func getLeaguesFromApi<T:Leagues>(compilationHandler: @escaping (_ response:[T]?, ApiError?) ->(),type: T.Type) where T :Leagues
    
}
    
class ApiService:ApiServiceProtocol{
    
    
    
    func getLeaguesFromApi<T:Leagues>(compilationHandler: @escaping (_ response:[T]?, ApiError?) ->(),type: T.Type) where T :Leagues{
        //url obj
        let url:URL? = URL(string:type.url)
        //if i want to make post/get ,mofify it from request
        let request = URLRequest(url: url!)
        //open session for http request
        let session = URLSession(configuration: URLSessionConfiguration.default)
        //begin closure for request
        let task = session.dataTask(with: request){
            data,response,error in
            do{
               
                if let data = data{
                    print("dlk")
                    let result = try JSONDecoder().decode(ApiResponse<T>.self,from: data)
                    
                    // var n =  result as! FootballLeaguesJsonResult
                    // print(n.result?.count)
                    compilationHandler(result.result ,nil)
                
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
        
        
       
    
    
    
    
    
    
    
    
