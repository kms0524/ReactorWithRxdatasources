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

class MainViewController: UIViewController, ReactorKit.View {
    
    typealias Reactor = MainReactor
    typealias DataSources = RxCollectionViewSectionedReloadDataSource<MainCollectionViewSectionModel>
    
    private var dataSource2 = Observable<[String]>.of((1...30).map(String.init))
    
    public var disposeBag = DisposeBag()
    
    
    
    lazy var dataSources: DataSources = RxCollectionViewSectionedReloadDataSource(configureCell: { dataSource, collectionView, indexPath, items -> UICollectionViewCell in
        
        let sectionItem = dataSource[indexPath]
        
        
        switch items {
        case .item(let reactor):
            let cell = collectionView.dequeueReusableCell(for: indexPath) as MainCollectionViewCell
            cell.reactor = reactor
            
            return cell
        }}, configureSupplementaryView: { dataSource, collectionView, kind, indexPath -> UICollectionReusableView in
            
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.defaultHeaderIdentifier, for: indexPath) as! HeaderCollectionReusableView
                
                let section = dataSource.sectionModels[indexPath.section]
                
                section.headerReactor.state.map { $0.time }
                    .bind(to: headerView.timeLabel.rx.text)
                    .disposed(by: self.disposeBag)
                
                section.headerReactor.state.map { $0.count }
                    .bind(to: headerView.countLabel.rx.text)
                    .disposed(by: self.disposeBag)
                
                return headerView
            default:
                fatalError()
            }
            
//            let header: HeaderCollectionReusableView =
//            collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.defaultHeaderIdentifier, for: indexPath)
//
//            dataSource[indexPath.section].configure(header)
//
//            var section = dataSource[indexPath.section]
//
//            header.reuseIdentifier =
//            header.reactor = HeaderCollectionReusableViewReactor(time: dataSources.sectionModels[indexPath.section].items, count: <#T##String#>)
            
            
            
//            switch kind {
//            case UICollectionView.elementKindSectionHeader:
//                let header: HeaderCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: indexPath)
//
//                var count = reactor.currentState.
//
//
//                let sectionType = SectionType(sectionIndex: indexPath.section)
//
//
//                let headerReactor = HeaderCollectionReusableViewReactor(item: HeaderModel(time: <#T##String?#>, count: <#T##String?#>))
//
//                header.bindSection(type: sectionType)
//
//                return header
//            default:
//                return UICollectionReusableView()
//            }
        })
    
    var mainView = MainView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func bind(reactor: MainReactor) {
        
    }
    
    func bindHeader(reactor: HeaderCollectionReusableViewReactor) {
        
        
    }
    
    
}
