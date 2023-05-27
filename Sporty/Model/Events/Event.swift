//
//  Event.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//

import Foundation


protocol Event:Decodable{
    static var  LatestUrl:String {get}
    static var  NowPlayingUrl:String {get}
    var date:String?        { get }
    var time:String?        { get  }
    var firstTeam:String?    { get  }
    var secondTeam:String?   { get  }
    var firstTemaLogo:String?{ get  }
    var secondTeamLogo:String?{ get  }
    var gameResult:String?    { get  }
    
}
