//
//  DetailViewModel.swift
//  WBooks
//
//  Created by daniel.f.munoz on 30/08/21.
//

import Foundation

class DetailViewModel {
    
    let book: Book
    let userId: Int
    
    init(book: Book) {
        self.book = book
        self.userId = 10
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
            userId: userId,
            bookId: book.id,
            from: formatter.string(from: today),
            to: formatter.string(from: tomorrow)
        )
        
        return parameters
    }
    
    func addWishList() {
        debugPrint("Add to wishlist press...")
    }

}
