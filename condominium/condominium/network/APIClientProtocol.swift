//
//  APIClientProtocol.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 26/08/24.
//

import Foundation
import Alamofire

protocol APIClientProtocol {
    func login(email: String, password: String, completion:@escaping (Result<User, AFError>)->Void)
    func getPosts(type: String, completion:@escaping (Result<[Post], AFError>)->Void)
}
