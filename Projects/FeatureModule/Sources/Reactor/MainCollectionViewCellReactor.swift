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
        var favorite: UIImage?
    }
    
    public let initialState: State
    
    init(item: MainCollectionViewCell) {
        self.initialState = State(category: item.categoryLabel.text, name: item.nameLabel.text, count: item.countLabel.text, favorite: item.favoriteImageView.image)
    }
}
