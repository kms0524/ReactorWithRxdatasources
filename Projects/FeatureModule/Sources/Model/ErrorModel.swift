//
//  ErrorModel.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

public struct ErrorModel {
    
    let success: Bool?
    let status: Int?
    let message: String?
    
    public init(success: Bool?, status: Int?, message: String?) {
        self.success = success
        self.status = status
        self.message = message
    }
}
