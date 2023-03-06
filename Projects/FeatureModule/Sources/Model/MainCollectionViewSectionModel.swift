//
//  MainCollectionViewSectionModel.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/20.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import RxDataSources

public enum MainCollectionViewSectionModel {
    case lastWeekSection([MainCollectionViewSectionItem])
    case todaySection([MainCollectionViewSectionItem])
    case thisWeekSection([MainCollectionViewSectionItem])
    case nextWeekSection([MainCollectionViewSectionItem])
}


public enum MainCollectionViewSectionItem {
    case item(MainCollectionViewCellReactor)
}


extension MainCollectionViewSectionModel: SectionModelType {
    
    
    public typealias Item = MainCollectionViewSectionItem
    
    public var items: [Item] {
        switch self {
            
        case .lastWeekSection(let items):
            return items
            
        case .todaySection(let items):
            return items
            
        case .thisWeekSection(let items):
            return items
            
        case .nextWeekSection(let items):
            return items
        }
    }
    
    public init(original: MainCollectionViewSectionModel, items: [MainCollectionViewSectionItem]) {
        switch original {
        case .lastWeekSection:
            self = .lastWeekSection(items)
            
        case .todaySection:
            self = .todaySection(items)
            
        case .thisWeekSection:
            self = .todaySection(items)
            
        case .nextWeekSection:
            self = .nextWeekSection(items)
        }
    }
    
    var headerTime: String? {
        switch self {
        case .lastWeekSection:
            return "저번주"
        case .todaySection:
            return "오늘"
        case .thisWeekSection:
            return "저번주"
        case .nextWeekSection:
            return "이번주"
        }
    }
    
    var headerCount: String? {
        switch self {
            
        case .lastWeekSection:
            return ""
        case .todaySection:
            return ""
        case .thisWeekSection:
            return ""
        case .nextWeekSection:
            return ""
        }
        
    }
    
}
