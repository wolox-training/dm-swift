//
//  BookRepository.swift
//  WBooks
//
//  Created by daniel.f.munoz on 23/08/21.
//

import Foundation
import Alamofire

internal class BookRepository {
        
    public func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {

        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/books")!

        AF.request(url)
            .responseDecodable(of: [Book].self) { response in

            switch response.result {

            case .success(let books):
                onSuccess(books)
                
            case .failure(let error):
                onError(error)
            }
        }
    }
    
}

enum BookError: Error {
    case decodeError
}
