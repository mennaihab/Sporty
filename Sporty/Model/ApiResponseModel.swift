//
//  ApiResponseModel.swift
//  Sporty
//
//  Created by Menna Ihab on 25/05/2023.
//

import Foundation


struct ApiResponse<T:Decodable>:Decodable{
   var  success:Int
    var  result:[T]
}

