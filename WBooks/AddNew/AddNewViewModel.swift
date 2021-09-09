//
//  AddNewViewModel.swift
//  WBooks
//
//  Created by daniel.f.munoz on 20/08/21.
//

import Foundation

class AddNewViewModel {
    
    let status = "Available"
    let image = "image"
    var book: BookRequest?
    
    func addNewBook(action: @escaping (Error?) -> () ) {
        
        let onSuccess = { (book: Book) in
            action(nil)
        }
                
        let onError = { error in
            action(error)
        }
        
        let repository = BookRepository()
        repository.addBook(parameters: getParametersBook(), onSuccess: onSuccess, onError: onError)
    }
    
    func setParametersBook(title: String, author: String, genre: String, year: String){
        book = BookRequest(
            title: title,
            author: author,
            genre: genre,
            year: year,
            image: image,
            status: status
        )
    }
    
    func getParametersBook() -> BookRequest {
        return book!
    }
    
}
