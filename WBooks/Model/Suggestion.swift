//
//  Suggestion.swift
//  WBooks
//
//  Created by daniel.f.munoz on 6/09/21.
//

import Foundation

struct Suggestion: Codable {
    
    let id: Int
    let title: String
    let author: String
    let userId: Int
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case userId = "user_id"
        case link
    }

}
