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
import SkeletonView

public class MainViewController: UIViewController, ReactorKit.View {
    
    public typealias Reactor = MainReactor
    public var disposeBag = DisposeBag()
    
    var mainView = MainView()
    
    public init(_ reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    private var dataSources: RxCollectionViewSectionedReloadDataSource<MainCollectionViewSectionModel>!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        configureDataSource()
        reactor.state.map { $0.sections }
            .bind(to: self.mainView.collectionView.rx.items(dataSource: self.dataSources))
            .disposed(by: disposeBag)
    }
    
    private func configureDataSource() {
        dataSources = RxCollectionViewSectionedReloadDataSource<MainCollectionViewSectionModel>(configureCell: { dataSource, collectionView, indexPath, item in
            switch item {
            case .item(let reactor):
                let cell = collectionView.dequeueReusableCell(for: indexPath) as MainCollectionViewCell
                
                cell.reactor = reactor
                return cell
            }
        }, configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: indexPath) as HeaderCollectionReusableView
                
                let section = dataSource[indexPath.section]
                
                headerView.reactor = HeaderCollectionReusableViewReactor(section: section)
                
                return headerView
            default:
                fatalError()
            }
        })
    }
}
