//
//  SectionBackgroundDecorationView.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/03/14.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit

class SectionBackgroundDecorationView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        backgroundColor = .gray
        makeRounded(cornerRadius: 16)
    }
}
