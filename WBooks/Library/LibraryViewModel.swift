//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by daniel.f.munoz on 23/08/21.
//

import Foundation

class LibraryViewModel {
    
    var books: [Book]
    
    init() {
        books = []
    }
    
    func notification(){
        debugPrint("Notificaciones...")
    }
    
    func search(){
        debugPrint("Buscador...")
    }
    
    func getBooks(action: @escaping () -> () ) {
        
        let onSuccess = { (books: [Book]) in
            self.books = books
            action()
        }
                
        let onError = { error in
            debugPrint(error)
        }
        
        let repository = BookRepository()
        repository.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
    
    func createBooksViewModel() -> BooksViewModel {
        return BooksViewModel(books: books)
    }
    
}
