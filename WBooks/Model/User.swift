//
//  User.swift
//  WBooks
//
//  Created by daniel.f.munoz on 26/08/21.
//

import Foundation

internal struct User: Codable {
    
    let id: Int
    let username: String
    let image: String
    
    enum User: String, CodingKey {
        case id = "id"
        case username = "username"
        case image = "image"
    }

}
