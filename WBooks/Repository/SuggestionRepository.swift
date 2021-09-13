//
//  SeggestionRepository.swift
//  WBooks
//
//  Created by daniel.f.munoz on 6/09/21.
//

import Foundation
import Alamofire

internal class SuggestionRepository {
        
    public func fetchBooks(onSuccess: @escaping ([Suggestion]) -> Void, onError: @escaping (Error) -> Void) {

        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/suggestions")!

        AF.request(url)
            .responseDecodable(of: [Suggestion].self) { response in

            switch response.result {

            case .success(let suggestion):
                onSuccess(suggestion)
                
            case .failure(let error):
                onError(error)
            }
        }
    }
    
}
