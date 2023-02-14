//
//  TargetType.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/02/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Alamofire

public protocol TargetType: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: RequestParams { get }
    var contentType: ContentType { get }
}

enum Configuration {
    enum Error: Swift.Error {
        case misssingKey, invalidValue
    }
    
    static func value<T> (for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(
            forInfoDictionaryKey: key
        ) else {
            throw Error.misssingKey
        }
        
        switch object {
            
        case let value as T:
            return value
            
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
            
        default:
            throw Error.invalidValue
        }
    }
}

public enum API {
    
    static var baseAPIURL: String {
        return "https://34f06a62-7d9a-4d15-a619-953556ad83f5.mock.pstmn.io"
    }
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
}

public enum ContentType: String {
    case json = "Applicaion/json"
}

public enum RequestParams {
    case requestPlain
}

extension TargetType {
    public func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        
        var urlRequest = try URLRequest(url: url.appending(path: path), method: method)
        
        urlRequest.setValue(contentType.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        switch parameters {
            
        case .requestPlain:
            break
        }
        
        return urlRequest
    }
}

public extension TargetType {
    var contentType: ContentType {
        return .json
    }
}
