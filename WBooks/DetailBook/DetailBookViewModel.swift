//
//  DetailBookViewModel.swift
//  WBooks
//
//  Created by daniel.f.munoz on 25/08/21.
//

import Foundation
import Alamofire

class DetailBookViewModel {
    
    let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    func createDetailViewModel() -> DetailViewModel {
        return DetailViewModel(book: book)
    }
    
    func createCommentsViewModel() -> CommentsViewModel {
        return CommentsViewModel(bookId: book.id)
    }
    
    func isAvaibleRent() -> Bool {
        return book.status == "Available"
    }
    
}
