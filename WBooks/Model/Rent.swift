//
//  Rent.swift
//  WBooks
//
//  Created by daniel.f.munoz on 29/08/21.
//

import Foundation

struct Rent: Codable {
    
    let user_id: Int
    let book_id: Int
    let from: String
    let to: String
    
    enum Rent: String, CodingKey {
        case user_id = "user_id"
        case book_id = "book_id"
        case from = "from"
        case to = "to"
    }

}
