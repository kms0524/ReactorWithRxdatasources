//
//  ServiceProvider.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import ServiceModule

public protocol ServiceProviderType: AnyObject {
    
    var infoRepository: InfoRepository { get }
    
}

public final class ServiceProvider: ServiceProviderType {
    public init() { }
    
    lazy public var infoRepository: InfoRepository = InfoRepositoryImp(provider: self)
}
