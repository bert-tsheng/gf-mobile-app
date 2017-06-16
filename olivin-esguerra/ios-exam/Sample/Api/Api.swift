//
//  Api.swift
//  Sample
//
//  Created by Olivin Esguerra on 14/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit
import UIKit
import Moya
import Alamofire

enum TEST {
    case login(email: String, password : String)
    case getFresh(offset : Int)
}


extension TEST: TargetType {
    
    var baseURL: URL { return URL(string: API.BASEURL)! }
    var path: String {
        switch self {
        case .login:
            return API.LOGIN.URL
        case .getFresh:
            return API.FRESH.URL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login: return .post
        default: return .get
        }
        
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .login(let email ,let password):
            return  ["email": email, "password": password]
        case .getFresh(offset: let offset):
            return ["page":offset]
        default:
            return nil
        }
    }
    
    var task: Task {
        return .request
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        switch self {
        case .login(let email,let password):
            return "{\"email\": \(email), \"password\": \(password)}".data(using: .utf8)!
        case .getFresh:
            return "".data(using: .utf8)!
        }
    }
}

public func url(route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

let endpointClosure = { (target: TEST) -> Endpoint<TEST> in
    let defaultEndpoint = MoyaProvider<TEST>.defaultEndpointMapping(for: target)
    switch target{
    case .login:
        return defaultEndpoint
    default:
        return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization":"Bearer \(AppData.sharedInstance.token!)"])
    }
}

let requestClosure = { (endpoint: Endpoint<TEST>, done: @escaping MoyaProvider.RequestResultClosure) in
    var request = endpoint.urlRequest!
    done(.success(request))
}

private extension String {
    var URLEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
}


