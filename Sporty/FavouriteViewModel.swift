//
//  FavouriteViewModel.swift
//  Sporty
//
//  Created by Menna Ihab on 31/05/2023.
//

import Foundation
import CoreData

class FavouriteaviewModel{
    
    var favouriteArray:[FavouriteCell] = []
    
    var numberOfCells = 0{
        didSet{
            updateTableClosure?()
        }
    }
    
    
    
    var updateTableClosure: (()->())?
    
    
    func fetchFavourites(context : NSManagedObjectContext){
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"TeamData")
        do{
            let teams = try context.fetch(fetchReq)
            
            var temp:[FavouriteCell] = []
            for t in teams {
                var team = FavouriteCell()
                team.id =  (t.value(forKey: "teamId") as? Int)
                team.name = t.value(forKey: "teamName") as? String
                team.logo = t.value(forKey: "teamLogo") as? String
                team.type = t.value(forKey: "sportType") as? String
                temp.append(team)
                
            }
            favouriteArray = temp
            numberOfCells = favouriteArray.count
        }
        catch{
            print("error")
        }
        
    }
}
         
         struct FavouriteCell{
            var id:Int?
            var name:String?
            var logo:String?
             var type:String?
        }
