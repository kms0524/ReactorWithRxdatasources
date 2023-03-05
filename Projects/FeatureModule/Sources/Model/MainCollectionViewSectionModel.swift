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
    case lastWeekSection([MainCollectionViewSectionItem])
    case todaySection([MainCollectionViewSectionItem])
    case thisWeekSection([MainCollectionViewSectionItem])
    case nextWeekSection([MainCollectionViewSectionItem])
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
    
    var headerReactor: HeaderCollectionReusableViewReactor {
        switch self {
            
        case .lastWeekSection:
            return HeaderCollectionReusableViewReactor(time: "저번주", count: "1개")
        case .todaySection:
            return HeaderCollectionReusableViewReactor(time: "오늘", count: "1개")
            
        case .thisWeekSection(_):
            return HeaderCollectionReusableViewReactor(time: "이번주", count: "1개")
        case .nextWeekSection(_):
            return HeaderCollectionReusableViewReactor(time: "다음주", count: "1개")
        }
    }
    
//    func configureHeader(_ header: HeaderCollectionReusableView) {
//        switch self {
//        case .lastWeekSection:
//
//        case .todaySection(_):
//            <#code#>
//        case .thisWeekSection(_):
//            <#code#>
//        case .nextWeekSection(_):
//            <#code#>
//        }
//    }
    
//    public var items: [MainCollectionViewSectionItem] {
//        switch self {
//        case .section(let items): return items
//        }
//    }
//
//    public init(original: MainCollectionViewSectionModel, items: [MainCollectionViewSectionItem]) {
//        switch original {
//        case .section:
//            self = .section(items)
//        }
//    }
}

public enum MainCollectionViewSectionItem {
    case item(MainCollectionViewCellReactor)
}
