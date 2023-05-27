//
//  Team.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//

import Foundation

protocol Team:Decodable{
    static var url:String {get}
    var id:Int?{get}
    var name:String?{get}
    var logo:String? {get}
    
   
    
}
