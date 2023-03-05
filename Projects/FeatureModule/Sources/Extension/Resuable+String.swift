//
//  Resuable+String.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/03/05.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit
import Reusable

extension Reusable where Self: UICollectionReusableView {
    static var defaultHeaderIdentifier: String {
        return String(describing: self)
    }
}
