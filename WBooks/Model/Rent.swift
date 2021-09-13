//
//  Rent.swift
//  WBooks
//
//  Created by daniel.f.munoz on 29/08/21.
//

import Foundation

struct Rent: Codable {
    
    let userId: Int
    let bookId: Int
    let from: String
    let to: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case bookId = "book_id"
        case from
        case to
    }

}

struct RentBook: Codable {
    
    let userId: Int
    let bookId: Int
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case bookId = "book_id"
    }

}
