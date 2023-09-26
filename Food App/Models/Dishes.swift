//
//  Dishes.swift
//  Food App
//
//  Created by Hatem on 15/09/2023.
//

import Foundation

struct Dish : Decodable {
    
    let id , name , image , description  : String?
    let calories : Int?
 
 
    
    var formattedCalories : String {
        return "\(calories ?? 0 )"
    }
    
}
