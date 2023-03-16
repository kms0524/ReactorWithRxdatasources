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
import SkeletonView

public class HeaderCollectionReusableView: UICollectionReusableView, ReactorKit.View, Reusable {
    
    public typealias Reactor = HeaderCollectionReusableViewReactor
    
    
    public var disposeBag = DisposeBag()
    
    public typealias Action = NoAction
    
    var timeLabel: UILabel = {
        var label = UILabel()
        label.textColor = .label
        return label
    }()
    
//    var countLabel: UILabel = {
//        var label = UILabel()
//        label.textColor = .label
//        return label
//    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        addSubviews([timeLabel])
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(13)
            make.width.equalTo(104)
        }
        
//        countLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(3)
//            make.bottom.equalToSuperview().offset(-3)
//            make.trailing.equalToSuperview()
//        }
    }
    
    public func bind(reactor: HeaderCollectionReusableViewReactor) {
        reactor.state.map { $0.sectionType }
            .filter { $0 != nil }
            .bind(with: self, onNext: { owner, sectionType in
                owner.timeLabel.text = sectionType?.headerTime
            })
            .disposed(by: disposeBag)
        
        
    }
    
}
