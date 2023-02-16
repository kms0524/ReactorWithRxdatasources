//
//  NetworkService.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/02/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

final public class NetworkService {
    public static var shared = NetworkService()
    
    private init() {}
    
    public let infoRepository = InfoAPI(isLogging: true)
    
}
