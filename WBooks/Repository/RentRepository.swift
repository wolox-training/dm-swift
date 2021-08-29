//
//  RentRepository.swift
//  WBooks
//
//  Created by daniel.f.munoz on 26/08/21.
//

import Foundation
import Alamofire

internal class RentRepository {
        
    public func setRent(id: Int, parameter: Parameters, onSuccess: @escaping (Rent) -> Void, onError: @escaping (Error) -> Void) {
        
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/users/\(id)/rents")!
        
        AF.request(url, method: .post, parameters: parameter).responseDecodable(of: Rent.self) { response in

            switch response.result {

            case .success(let rent):
                onSuccess(rent)
                
            case .failure(let error):
                onError(error)
            }
        }
    }
    
}

enum RentError: Error {
    case decodeError
}
