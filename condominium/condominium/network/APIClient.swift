//
//  APIClient.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Alamofire
import Foundation

class APIClient: APIClientProtocol {
    
    static var shared = APIClient()
    
    @discardableResult
    private func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route)
                .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                    completion(response.result)
        }
    }
    
    func login(email: String, password: String, completion:@escaping (Result<User, AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        performRequest(
            route: APIRouter.login(email: email, password: password),
            decoder: jsonDecoder,
            completion: completion
        )
    }
    
    func getPosts(type: String, completion: @escaping (Result<[Post], AFError>) -> Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        performRequest(
            route: APIRouter.post(type: type),
            decoder: jsonDecoder,
            completion: completion
        )
    }
}
