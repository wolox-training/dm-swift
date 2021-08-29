//
//  Book.swift
//  WBooks
//
//  Created by daniel.f.munoz on 12/08/21.
//

import Foundation

internal struct Book: Codable {
    
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
    let status: String
    
    enum BookKey: String, CodingKey {
        case id = "id"
        case title = "title"
        case author = "author"
        case genre = "genre"
        case year = "year"
        case image = "image"
        case status = "status"
    }

}
