//
//  SectionType.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/03/05.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit

public enum SectionType {
    case lastWeek
    case today
    case thisWeek
    case nextWeek
    case unknown
    
    init(sectionIndex: Int) {
        switch sectionIndex {
        case 1:
            self = .lastWeek
            
        case 2:
            self = .today
            
        case 3:
            self = .thisWeek
            
        case 4:
            self = .nextWeek
            
        default:
            self = .unknown
        }
    }
}

extension SectionType {
    var time: String {
        switch self {
        case .lastWeek:
            return "저번주"
            
        case .today:
            return "오늘"
            
        case .thisWeek:
            return "이번주"
            
        case .nextWeek:
            return "다음주"
            
        case .unknown:
            return ""
        }
    }
    var count: String {
        switch self {
        case .lastWeek:
            return "1개"
            
        case .today:
            return "2개"
            
        case .thisWeek:
            return "3개"
            
        case .nextWeek:
            return "4개"
            
        case .unknown:
            return ""
        }
    }
}
