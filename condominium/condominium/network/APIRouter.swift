//
//  APIRouter.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Alamofire
import Foundation

enum APIRouter: URLRequestConvertible {
    
    case login(email: String, password: String)
    case post(type: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .post:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .post(let type):
            return "/post/getpost/" + type
        }
    }
    
    // MARK: - Parameters
    private var parameters: [URLQueryItem]? {
        switch self {
        case .login:
            return nil
        case .post:
            return nil
        }
    }
    
    private var baseURL: String {
        switch self {
        default:
            return ServerConstants.ProductionServer.basePostURL
        }
    }
    
    private var body: [String: Any]? {
        switch self {
        case .login(let email, let password):
            return ["email": email, "password": password]
        default:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        if let body {
            let jsonData = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
        }

        urlRequest.setValue("application/json", forHTTPHeaderField:"Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // Parameters
        if let parameters {
            urlRequest.url?.append(queryItems: parameters)
        }
        
        return urlRequest
    }
}
