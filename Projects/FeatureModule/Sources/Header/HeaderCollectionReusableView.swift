//
//  HeaderCollectionReusableView.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/02/20.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Reusable

public class HeaderCollectionReusableView: UICollectionReusableView, Reusable {
    
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
}
