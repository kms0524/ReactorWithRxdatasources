//
//  BaseProvider.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

public class BaseProvider {
    unowned let provider: ServiceProviderType
    
    public init(provider: ServiceProviderType) {
        self.provider = provider
    }
}
