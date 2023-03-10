//
//  MainViewController.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/10.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import Reusable
import RxDataSources

public class MainViewController: UIViewController, ReactorKit.View {
    
    public typealias Reactor = MainReactor
    //    public typealias DataSource = RxCollectionViewSectionedReloadDataSource<MainCollectionViewSectionModel>
    
    public var disposeBag = DisposeBag()
    
    public init(_ reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let dataSource = RxCollectionViewSectionedReloadDataSource <MainCollectionViewSectionModel>(configureCell: { _, collectionView, indexPath, items -> UICollectionViewCell in
        
        switch items {
        case .item(let reactor):
            let cell = collectionView.dequeueReusableCell(for: indexPath) as MainCollectionViewCell
            cell.reactor = reactor
            return cell
            
        }}, configureSupplementaryView: { dataSource, collectionView, kind, indexPath -> UICollectionReusableView in
            
            
            
            
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.defaultHeaderIdentifier, for: indexPath) as! HeaderCollectionReusableView
                
                let section = dataSource[indexPath.section]
                
                
                
                headerView.reactor = HeaderCollectionReusableViewReactor(section: section)
                
            
                
                
                //                section.headerReactor.state.map { $0.time }
                //                    .bind(to: headerView.timeLabel.rx.text)
                //                    .disposed(by: self.disposeBag)
                //
                //                section.headerReactor.state.map { $0.count }
                //                    .bind(to: headerView.countLabel.rx.text)
                //                    .disposed(by: self.disposeBag)
                
                return headerView
            default:
                fatalError()
            }
        })
    
    //    private enum Size {
    //        static let screenHeight = UIScreen.main.bounds.height
    //        static let screenWidth = UIScreen.main.bounds.width
    //        static let sidePadding = CGFloat(20)
    //        static let sectionWidth = screenWidth - sidePadding * 2
    //        static let sectionSpacing = CGFloat(40)
    //        static let itemSpacing = CGFloat(10)
    //    }
    //
    //    private func configureCollectionViewLayout() -> UICollectionViewLayout {
    //        let layout = UICollectionViewCompositionalLayout { _, _ in
    //            let itemSize = NSCollectionLayoutSize(
    //                widthDimension: .fractionalWidth(1.0),
    //                heightDimension: .fractionalHeight(0.5)
    //            )
    //            let item = NSCollectionLayoutItem(layoutSize: itemSize)
    //
    //            let groupSize = NSCollectionLayoutSize(
    //                widthDimension: .fractionalWidth(1.0),
    //                heightDimension: .fractionalHeight(0.29)
    //            )
    //            let group = NSCollectionLayoutGroup.vertical(
    //                layoutSize: groupSize,
    //                subitems: [item]
    //            )
    //
    //            let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30.0))
    //            let header = NSCollectionLayoutBoundarySupplementaryItem(
    //                layoutSize: headerFooterSize,
    //                elementKind: UICollectionView.elementKindSectionHeader,
    //                alignment: .top
    //            )
    //
    //            let section = NSCollectionLayoutSection(group: group)
    //            section.boundarySupplementaryItems = [header]
    //
    //            return section
    //        }
    //        return layout
    //    }
    //
    //    lazy var collectionView: UICollectionView = {
    //        let collectionView = UICollectionView(
    //            frame: .zero,
    //            collectionViewLayout: configureCollectionViewLayout()
    //        )
    //        collectionView.register(cellType: MainCollectionViewCell.self)
    //        collectionView.register(supplementaryViewType: HeaderCollectionReusableView.self, ofKind: UICollectionView.elementKindSectionHeader)
    //
    //        return collectionView
    //    }()
    
    var mainView = MainView()
    
    public override func loadView() {
        super.loadView()
        view = mainView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    public func bind(reactor: MainReactor) {
        bindAction(reactor)
        bindState(reactor)
    }
    
    
}


extension MainViewController {
    private func bindAction(_ reactor: Reactor) {
        rx.viewWillAppear
            .map { _ in Reactor.Action.viewWillAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(_ reactor: Reactor) {
        
    
        
        reactor.state.map { $0.sections }
            .bind(to: self.mainView.collectionView.rx.items(dataSource: self.dataSource))
            .disposed(by: disposeBag)
        
        
        
    }
}
