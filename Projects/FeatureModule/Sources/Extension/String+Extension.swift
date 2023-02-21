//
//  String+Extension.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/21.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit

public func stringToUIImage(str: String) -> UIImage {
    switch str {
    case "ON" :
        return UIImage(systemName: "heart.fill")!
        
    case "OFF" :
        return UIImage(systemName: "heart")!
        
    default:
        return UIImage(systemName: "questionmark")!
    }
}

public func stringToUIColor(str: String) -> UIColor {
    switch str {
    case "BLACK":
        return FeatureModuleAsset.black.color
        
    case "PURPLE":
        return FeatureModuleAsset.purple.color
        
    default:
        return FeatureModuleAsset.green.color
    }
}
