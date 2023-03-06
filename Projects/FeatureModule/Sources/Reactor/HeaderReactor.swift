//
//  HeaderReactor.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/03/01.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ReactorKit
import RxDataSources
import Reusable

public class HeaderCollectionReusableViewReactor: ReactorKit.Reactor, Reusable {
    
    public typealias Action = NoAction
    
    public struct State {
        var time: String?
        var count: String?
        var sectionType: MainCollectionViewSectionModel?
    }
    
    public var initialState: State
    
    public init(time: String, count: String) {
        self.initialState = State(time: time, count: count)
    }
    
    public init(section: MainCollectionViewSectionModel) {
        self.initialState = State(sectionType: section)
    }
}
