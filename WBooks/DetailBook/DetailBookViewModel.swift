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
    
    func rent(action: @escaping (Error?) -> () ) {
        
        let onSuccess = { (rent: Rent) in
            action(nil)
        }
                
        let onError = { error in
            action(error)
        }
        
        let repository = RentRepository()
        repository.setRent(parameters: getParametersRent(), onSuccess: onSuccess, onError: onError)
    }
    
    func getParametersRent() -> Rent {
        
        let today = Date()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let parameters = Rent(
            user_id: 10,
            book_id: book.id,
            from: formatter.string(from: today),
            to: formatter.string(from: tomorrow)
        )
        
        return parameters
    }
    
    func getIdAuthor(_ index: Int) -> Int {
        return comments[index].userId
    }
    
    func addWishList() {
        debugPrint("Add to wishlist press...")
    }
    
}
