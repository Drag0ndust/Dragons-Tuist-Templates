//
//  tuist.swift
//  ProjectDescriptionHelpers
//
//  Created by Thimo Bess on 21.03.22.
//

import ProjectDescription

let projectNameAttribute: Template.Attribute = .required("name")
let devTeamAttribute: Template.Attribute = .required("devTeam")
let bundleIdentifierPrefixAttribute: Template.Attribute = .required("bundlePrefix")

let appPath = "Targets/\(projectNameAttribute)"
let projectPath = "."
func templatePath(_ path: String) -> Path {
    "Stencils/\(path)"
}

let template = Template(
    description: "Tuist Project Template",
    attributes: [
        projectNameAttribute,
        devTeamAttribute,
        bundleIdentifierPrefixAttribute,
        .optional("copyright", default: ""),
        .optional("organization", default: ""),
    ],
    items: [
        .file(path: projectPath + "/Project.swift", 
              templatePath: templatePath("project.stencil")
        ),
        .file(
            path: ".gitignore",
            templatePath: templatePath("gitignore.stencil")
        ),
        .file(
            path: ".swiftformat",
            templatePath: templatePath("swiftformat.stencil")
        ),
        .file(
            path: ".tuist-version",
            templatePath: templatePath("tuistversion.stencil")
        ),
        .file(
            path: "Gemfile",
            templatePath: templatePath("Gemfile.stencil")
        ),

        //App Files
        .file(
            path: appPath + "/Sources/\(projectNameAttribute)App.swift",
            templatePath: templatePath("app.stencil")
        ),
        .file(
            path: appPath + "/Sources/ContentView.swift",
            templatePath: templatePath("ContentView.stencil")
        ),
        .directory(
                path: appPath + "/Resources",
                sourcePath: "ios/Assets.xcassets"
            ),
        .directory(
                path: appPath + "/Resources",
                sourcePath: "Preview Content"
            ),
        .file(
            path: appPath + "/Tests/\(projectNameAttribute)Tests.swift",
            templatePath: "../Stencils/AppTests.stencil"
        ),
        .file(
            path: appPath + "/UITests/\(projectNameAttribute)UITests.swift",
            templatePath: "../Stencils/UITests.stencil"
        ),

        //Tuist Files
        .file(
            path: projectPath + "/Tuist/Config.swift",
            templatePath: templatePath("Config.stencil")
        ),
        .file(
            path: projectPath + "/Tuist/Dependencies.swift",
            templatePath: templatePath("Dependencies.stencil")
        ),
    ]
)
