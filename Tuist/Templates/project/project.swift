//
//  tuist.swift
//  ProjectDescriptionHelpers
//
//  Created by Thimo Bess on 21.03.22.
//

import ProjectDescription

let projectNameAttribute: Template.Attribute = .required("name")
let devTeamAttribute: Template.Attribute = .required("devTeam")
let copyrightAttribute: Template.Attribute = .optional("copyright", default: "")
let bundleIdentifierPrefixAttribute: Template.Attribute = .required("bundlePrefix")
// let platformAttribute: Template.Attribute = .optional("platform", default: "iOS")

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
        copyrightAttribute,
        bundleIdentifierPrefixAttribute,
        // platformAttribute,
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

        //App Files
        .file(
            path: appPath + "/Sources/\(projectNameAttribute)App.swift",
            templatePath: templatePath("app.stencil")
        ),
        .directory(
                path: appPath + "/Resources",
                sourcePath: "ios/Assets.xcassets"
            ),
        .directory(
                path: appPath + "/Resources",
                sourcePath: "Preview Content"
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

        // .directory(path: "Targets/{{ project }}/Sources", sourcePath: "Stencils/Sources"),
        // .directory(path: "Targets/{{ project }}/Resources", sourcePath: "Stencils/Resources"),
        // .directory(path: "Targets/{{ project }}/Tests", sourcePath: "Stencils/Tests"),
        // .directory(path: "Targets/{{ project }}/UITests", sourcePath: "Stencils/UITests"),
    ]
)
