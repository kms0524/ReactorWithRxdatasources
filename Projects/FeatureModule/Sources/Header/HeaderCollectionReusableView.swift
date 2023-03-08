//
//  HeaderCollectionReusableView.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/20.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit
import SnapKit
import ReactorKit
import Then
import Reusable

public class HeaderCollectionReusableView: UICollectionReusableView, ReactorKit.View, Reusable {
    
    public typealias Reactor = HeaderCollectionReusableViewReactor
    
    
    public var disposeBag = DisposeBag()
    
    public typealias Action = NoAction
    
    var timeLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    var countLabel: UILabel = {
       var label = UILabel()
        
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        addSubviews([timeLabel, countLabel])
        
        timeLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.equalTo(104)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(3)
            make.bottom.equalToSuperview().offset(-3)
            make.trailing.equalToSuperview()
        }
    }
    
    
//    public func bindReactor(reactor: Reactor) {
//        var time = reactor.currentState.time
//        timeLabel.text = time
//    }
    
    public func bind(reactor: HeaderCollectionReusableViewReactor) {
        reactor.state.map { $0.time }
            .bind(to: timeLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.count }
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
//    public func bindMainReactor(reactor: MainReactor) {
//        reactor.state.map { "\(String(describing: $0.todayCount))" }
//            .bind(to: countLabel.rx.text)
//            .disposed(by: disposeBag)
//    }
//
//    public func bindSection(type: SectionType) {
//        self.timeLabel.text = type.time
//        self.countLabel.text = type.count
//    }
}
