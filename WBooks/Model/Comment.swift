//
//  Comment.swift
//  WBooks
//
//  Created by daniel.f.munoz on 26/08/21.
//

import Foundation

internal struct Comment: Codable {
    
    let id: Int
    let user_id: Int
    let book_id: Int
    let content: String
    
    enum Comment: String, CodingKey {
        case id = "id"
        case user_id = "user_id"
        case book_id = "book_id"
        case content = "content"
    }

}
