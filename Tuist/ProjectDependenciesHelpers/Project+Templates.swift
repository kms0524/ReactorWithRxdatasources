//
//  Project+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2023/01/17.
//

import ProjectDescription
import MyPlugin

public extension Project {
    
    static func makeModule(
        name: String,
        platform: Platform = .iOS,
        product: Product,
        packages: [Package] = [],
        organizationName: String = "RWRxDatasource.io",
        deploymentTarget: DeploymentTarget? = .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist = .default,
        resourceSynthesizers: ProjectDescription.ResourceSynthesizer
    ) -> Project {
        let settings: Settings =
            .settings(base: [:],
                      configurations: [
                        .debug(name: .debug),
                        .release(name: .release)
                      ],
                      defaultSettings: .recommended
            )
        
        let appTarget = Target(
            name: name,
            platform: platform,
            product: product,
            bundleId: "\(organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )
        
        let schemes: [Scheme] = [
            .makeScheme(target: .debug, name: name)
        ]
        
        let targets: [Target] = [appTarget]
        
        return Project(
            name: name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
}

extension Scheme {
    static func makeScheme(
        target: ConfigurationName,
        name: String)
    -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            runAction: .runAction(configuration: target)
        )
    }
}
