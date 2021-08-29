//
//  Rent.swift
//  WBooks
//
//  Created by daniel.f.munoz on 29/08/21.
//

import Foundation

internal struct Rent: Codable {
    
    let id: Int
    let user_id: Int
    let book_id: Int
    let from: String
    let to: String
    
    enum Rent: String, CodingKey {
        case id = "id"
        case user_id = "userID"
        case book_id = "bookID"
        case from = "from"
        case to = "to"
    }

}
