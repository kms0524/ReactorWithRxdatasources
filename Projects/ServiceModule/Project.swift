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
    name: "ServiceModule",
    product: .staticFramework,
    dependencies: [
        .Project.ThirdPartyLib
    ],
    resourceSynthesizers: .assets()
)
