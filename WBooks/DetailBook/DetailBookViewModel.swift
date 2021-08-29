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
    var comments: [Comment]
    
    init(book: Book) {
        self.book = book
        self.comments = []
    }
    
    func getComments(action: @escaping ([Comment]) -> () ) {
        
        let onSuccess = { (comments: [Comment]) in
            self.comments = comments
            action(comments)
        }
                
        let onError = { error in
            debugPrint(error)
        }
        
        let repository = CommentsRepository()
        repository.fetchComments(id: book.id, onSuccess: onSuccess, onError: onError)
    }
    
    func getUserComment(id: Int, action: @escaping (User) -> () ) {
        
        let onSuccess = { (user: User) in
            action(user)
        }
                
        let onError = { error in
            debugPrint(error)
        }
        
        let repository = UserRepository()
        repository.getUser(id: id, onSuccess: onSuccess, onError: onError)
    }
    
    func validateStatusRent() -> Bool {
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
        repository.setRent(id: 10, parameter: getParametersRent(), onSuccess: onSuccess, onError: onError)
    }
    
    func getParametersRent() -> Parameters {
        
        let parameters: Parameters = [
            "userID": 10,
            "bookID": book.id,
            "from": "2021-08-29",
            "to": "2021-08-30"
        ]
                
        return parameters
    }
    
    func addWishList() {
        debugPrint("Add to wishlist press...")
    }
    
}
