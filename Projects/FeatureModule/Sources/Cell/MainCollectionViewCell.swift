//
//  MainCollectionViewCell.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit
import SnapKit
import Reusable
import Then
import ReactorKit

public class MainCollectionViewCell: UICollectionViewCell, ReactorKit.View, Reusable {
    
    public var disposeBag = DisposeBag()
    
    public typealias Reactor = MainCollectionViewCellReactor
    
    var categoryLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    var countLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    var favoriteImageView: UIImageView = {
        var imageView = UIImageView()
        
        return imageView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.makeRounded(cornerRadius: 16)
        makeRounded(cornerRadius: 15)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        addSubviews([categoryLabel, nameLabel, countLabel, favoriteImageView])
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(16)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview().offset(16)
        }
        
        countLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-12)
            make.leading.equalToSuperview().offset(16)
        }
        
        let favoriteImageViewConstant = contentView.frame.height - 30
        
        favoriteImageView.snp.makeConstraints { make in
            make.height.width.equalTo(favoriteImageViewConstant)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    public func bind(reactor: MainCollectionViewCellReactor) {
        self.categoryLabel.text = reactor.currentState.category
        self.nameLabel.text = reactor.currentState.name
        self.countLabel.text = reactor.currentState.count
        
        switch reactor.currentState.favorite {
        case "ON":
            self.favoriteImageView.image = UIImage(systemName: "heart.fill")
            
        case "OFF":
            self.favoriteImageView.image = UIImage(systemName: "heart")
            
        default:
            return self.favoriteImageView.image = UIImage(systemName: "questionmark")
         }
        
//        reactor.state.map { $0.favorite }
//            .distinctUntilChanged()
//            .subscribe(onNext: { [weak self] string in
//                if string == "ON" {
//                    self?.favoriteImageView.image = UIImage(systemName: "heart.fill")
//                }
//                else {
//                    self?.favoriteImageView.image = UIImage(systemName: "heart")
//                }
//            })
//            .disposed(by: disposeBag)
    }
    
}
