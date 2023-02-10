//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2023/01/17.
//

import ProjectDescription

let workspace = Workspace(
    name: "RWRxdatasources",
    projects: [
        "Projects/App",
        "Projects/FeatureModule",
        "Projects/ServiceModule",
        "Projects/ThirdPartyLib"
    ]
)
