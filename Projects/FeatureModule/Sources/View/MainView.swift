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

class MainView: UIView, Reusable {

    private enum Size {
        static let screenHeight = UIScreen.main.bounds.height
        static let screenWidth = UIScreen.main.bounds.width
        static let sidePadding = CGFloat(20)
        static let sectionWidth = screenWidth - sidePadding * 2
        static let sectionSpacing = CGFloat(40)
        static let itemSpacing = CGFloat(10)
    }
    
    private func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.29)
            )
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: groupSize,
                subitems: [item]
            )
            
            let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30.0))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerFooterSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [header]
            
            return section
        }
        return layout
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: configureCollectionViewLayout()
        )
        collectionView.backgroundColor = .green
        collectionView.register(cellType: MainCollectionViewCell.self)
        collectionView.register(supplementaryViewType: HeaderCollectionReusableView.self, ofKind: UICollectionView.elementKindSectionHeader)
        
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubviews([collectionView])
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide).offset(21)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-21)
            make.bottom.equalToSuperview()
        }
    }
}
