//
//  LeaguesProtocol.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//

import Foundation

protocol Leagues:Decodable {
    
    static var url:String {get}
    var  id:Int { get }
    var  name:String { get }
    
}
