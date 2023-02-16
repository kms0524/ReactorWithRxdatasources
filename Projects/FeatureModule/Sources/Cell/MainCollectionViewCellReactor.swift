//
//  MainCollectionViewCellReactor.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Reusable
import ReactorKit

public class MainCollectionViewCellReactor: ReactorKit.Reactor {
    
    public typealias Action = NoAction
    
    public let initialState: MainCollectionViewCellModel
    
    init(state: MainCollectionViewCellModel) {
        self.initialState = state
    }
}
