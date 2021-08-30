//
//  UserRepository.swift
//  WBooks
//
//  Created by daniel.f.munoz on 26/08/21.
//

import Foundation
import Alamofire

internal class UserRepository {
        
    public func getUser(id: Int, onSuccess: @escaping (User) -> Void, onError: @escaping (Error) -> Void) {
        
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/users/\(id)")!
        
        AF.request(url)
            .responseDecodable(of: User.self) { response in

            switch response.result {

            case .success(let user):
                onSuccess(user)
                
            case .failure(let error):
                onError(error)
            }
        }
    }
    
}

enum UserError: Error {
    case decodeError
}
