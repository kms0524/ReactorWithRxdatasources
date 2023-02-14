//
//  BaseResponseType.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/02/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

public struct BaseResponseType<T: Decodable>: Decodable {
    
    public let status: Int
    public let success: Bool
    public let message: String
    public let data: T?
    
}

public struct BaseErrorResponseType: Decodable {
    
    public let status: Int
    public let success: Bool
    public let message: String
    
}
