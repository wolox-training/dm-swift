//
//  Comment.swift
//  WBooks
//
//  Created by daniel.f.munoz on 26/08/21.
//

import Foundation

struct Comment: Codable {
    
    let id: Int
    let userId: Int
    let bookId: Int
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case bookId = "book_id"
        case content
    }

}
