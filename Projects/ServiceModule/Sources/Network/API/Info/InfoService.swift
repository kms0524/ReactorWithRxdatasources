//
//  InfoService.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/02/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Alamofire

public enum InfoService {
    case getInfo
}

extension InfoService: TargetType {
    public var baseURL: String {
        return API.baseAPIURL
    }
    
    public var path: String {
        switch self {
        case .getInfo:
            return "infos"
        }
    }
    
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .getInfo:
            return .get
        }
    }
    
    public var parameters: RequestParams {
        switch self {
        case .getInfo:
            return .requestPlain
        }
    }
    
    
}
