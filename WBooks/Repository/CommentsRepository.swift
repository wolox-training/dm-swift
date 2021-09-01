//
//  CommentsRepository.swift
//  WBooks
//
//  Created by daniel.f.munoz on 27/08/21.
//

import Foundation
import Alamofire

internal class CommentsRepository {
        
    public func fetchComments(id: Int, onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void) {
        
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/books/\(id)/comments")!
        
        AF.request(url)
            .responseDecodable(of: [Comment].self) { response in

            switch response.result {

            case .success(let comments):
                onSuccess(comments)
                
            case .failure(let error):
                onError(error)
            }
        }
    }
    
}
