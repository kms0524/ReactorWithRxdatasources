//
//  MainView.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit
import SnapKit
import Reusable
import Then

class MainView: UIView {

    private enum Size {
        static let screenHeight = UIScreen.main.bounds.height
        static let screenWidth = UIScreen.main.bounds.width
        static let sidePadding = CGFloat(20)
        static let sectionWidth = screenWidth - sidePadding * 2
        static let sectionSpacing = CGFloat(40)
        static let itemSpacing = CGFloat(10)
    }
    
    private func configureCollectionViewLayout() -> UICollectionViewLayout {
        
        return UICollectionViewLayout()
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: configureCollectionViewLayout()
        )
        
        return collectionView
    }()
    
}
