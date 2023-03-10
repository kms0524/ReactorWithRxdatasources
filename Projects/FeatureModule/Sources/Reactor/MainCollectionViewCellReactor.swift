//
//  MainCollectionViewCellReactor.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Reusable
import ReactorKit

public class MainCollectionViewCellReactor: ReactorKit.Reactor {
    
    public typealias Action = NoAction
    
    public struct State {
        var category: String?
        var name: String?
        var count: String?
        var favorite: String?
        var backgroundColor: String?
    }
    
    public let initialState: State
    
    public init(item: MainCollectionViewCellModel) {
        self.initialState = State(category: item.category, name: item.name, count: item.count, favorite: item.favorite, backgroundColor: item.backgroundColor)
    }
}
