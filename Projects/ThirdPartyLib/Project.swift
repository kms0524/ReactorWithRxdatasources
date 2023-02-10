//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2023/01/17.
//

import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

let project = Project.makeModule(
    name: "ThirdPartyLib",
    product: .framework,
    packages: [],
    dependencies: [
        .SPM.RxSwift,
        .SPM.RxCocoa,
        .SPM.RxRelay,
        .SPM.Alamofire,
        .SPM.Moya,
        .SPM.ReactorKit,
        .SPM.SnapKit,
        .SPM.RxDataSources,
        .SPM.Then,
        .SPM.Reusable
    ],
    resourceSynthesizers: .assets()
)
