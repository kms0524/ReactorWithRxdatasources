//
//  MainCollectionViewSectionModel.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/20.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit
import RxDataSources

public enum MainCollectionViewSectionModel {
    case section([MainCollectionViewSectionItem])
}

extension MainCollectionViewSectionModel: SectionModelType {
    
    public var items: [MainCollectionViewSectionItem] {
        switch self {
        case .section(let items): return items
        }
    }
    
    public init(original: MainCollectionViewSectionModel, items: [MainCollectionViewSectionItem]) {
        switch original {
        case .section:
            self = .section(items)
        }
    }
}

public enum MainCollectionViewSectionItem {
    case item(MainCollectionViewCellReactor)
}
