//
//  Config.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2023/01/17.
//

import ProjectDescription

let config = Config(
    plugins: [
        .local(path: .relativeToManifest("../../Plugins/Plugin"))
    ]
)
