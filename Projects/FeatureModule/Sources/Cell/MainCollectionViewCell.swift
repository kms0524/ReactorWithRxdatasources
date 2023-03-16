//
//  MainCollectionViewCell.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Reusable
import Then
import ReactorKit
import SkeletonView

public class MainCollectionViewCell: UICollectionViewCell, ReactorKit.View, Reusable {
    
    public var disposeBag = DisposeBag()
    
    var categoryLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        return label
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        return label
    }()
    
    var countLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        return label
    }()
    
    var favoriteImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.tintColor = .red
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
            make.centerY.equalToSuperview()
        }
    }
    
    public func bind(reactor: MainCollectionViewCellReactor) {
        reactor.state
            .map { $0.category }
            .bind(to: categoryLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state
            .map { $0.name }
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state
            .map { $0.count }
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.favorite }
            .map { stringToUIImage(str: $0) }
            .bind(to: favoriteImageView.rx.image)
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.backgroundColor }
            .subscribe(onNext: { [weak self] str in
                self?.backgroundColor = stringToUIColor(str: str)
            })
            .disposed(by: disposeBag)
    }
    
}
