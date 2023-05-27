//
//  Helpers.swift
//  Sporty
//
//  Created by Menna Ihab on 26/05/2023.
//
import Foundation

func calcTodayDate()->String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let currentDate = dateFormatter.string(from: Date())
    
    print(currentDate)
    return currentDate
}
