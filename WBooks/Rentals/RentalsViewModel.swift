//
//  RentalsViewModel.swift
//  WBooks
//
//  Created by daniel.f.munoz on 20/08/21.
//

import Foundation

class RentalsViewModel {
    
    let userId: Int = 10
    var suggestions: [Suggestion]
    var rents: [Book]
    
    init() {
        suggestions = []
        rents = []
    }
    
    func getSuggestBooks(action: @escaping () -> Void ) {
        
        let onSuccess = { (suggestions: [Suggestion]) in
            self.suggestions = suggestions
            action()
        }
                
        let onError = { error in
            debugPrint(error)
        }
        
        let repository = SuggestionRepository()
        repository.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
    
    func getRentalsBooks(action: @escaping () -> () ) {
        //TODO Validate
        let onSuccess = { (rentBooks: [RentBook]) in
            for rent in rentBooks {
                self.getBook(id: rent.bookId) { book in
                    self.rents.append(book)
                    if self.rents.count == rentBooks.count {
                        action()
                    }
                }
            }
        }
                
        let onError = { error in
            debugPrint(error)
        }
        
        let repository = RentRepository()
        repository.fetchBooks(id: userId, onSuccess: onSuccess, onError: onError)
    }
    
    func getBook(id: Int, action: @escaping (Book) -> () ) {
        
        let onSuccess = { (book: Book) in
            action(book)
        }
                
        let onError = { error in
            debugPrint(error)
        }
        
        let repository = BookRepository()
        repository.getBook(id: id, onSuccess: onSuccess, onError: onError)
    }
    
    func createBooksViewModel() -> BooksViewModel {
        return BooksViewModel(books: rents)
    }
    
    func createSuggestViewModel() -> SuggestionsViewModel {
        return SuggestionsViewModel(suggestions: suggestions)
    }
    
}
