//
//  CommentsViewModel.swift
//  WBooks
//
//  Created by daniel.f.munoz on 31/08/21.
//

import Foundation

class CommentsViewModel {
    
    let bookId: Int
    var comments: [Comment]
    
    init(bookId: Int) {
        self.bookId = bookId
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
        repository.fetchComments(id: bookId, onSuccess: onSuccess, onError: onError)
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
    
    func getIdAuthor(_ index: Int) -> Int {
        return comments[index].userId
    }
    
}
