//
//  Book.swift
//  WBooks
//
//  Created by daniel.f.munoz on 12/08/21.
//

import Foundation

struct Book: Codable {
    
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
    let status: String

}
