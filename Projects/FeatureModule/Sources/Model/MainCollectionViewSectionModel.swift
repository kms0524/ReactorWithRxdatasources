//
//  MainCollectionViewSectionModel.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/20.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit
import RxDataSources

public struct MainCollectionViewSectionModel {
    var time: String
    var count: Int
    public var items: [Item]
}

extension MainCollectionViewSectionModel: SectionModelType {
    public typealias Item = MainCollectionViewCellModel
    
    public init(original: MainCollectionViewSectionModel, items: [Item]) {
        self = original
        self.items = items
    }
}
