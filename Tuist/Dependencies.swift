//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2023/01/17.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: [
        .remote(
            url: "https://github.com/ReactiveX/RxSwift.git",
            requirement: .upToNextMajor(from: "6.5.0")
        ),
        .remote(
            url: "https://github.com/Moya/Moya.git",
            requirement: .upToNextMajor(from: "15.0.0")
        ),
        .remote(
            url: "https://github.com/ReactorKit/ReactorKit.git",
            requirement: .upToNextMajor(from: "3.0.0")
        ),
        .remote(
            url: "https://github.com/devxoul/Then.git",
            requirement: .upToNextMajor(from: "3.0.0.")
        ),
        .remote(
            url: "https://github.com/SnapKit/SnapKit.git",
            requirement: .upToNextMajor(from: "5.0.1")
        ),
        .remote(
            url: "https://github.com/RxSwiftCommunity/RxDataSources.git",
            requirement: .upToNextMajor(from: "5.0.0")
        ),
        .remote(
            url: "https://github.com/RxSwiftCommunity/RxAlamofire.git",
            requirement: .upToNextMajor(from: "6.1.2")
        ),
        .package(
            url: "https://github.com/AliSoftware/Reusable.git",
            .upToNextMajor(from: "4.1.0")
        )
    ],
    platforms: [.iOS]
)
