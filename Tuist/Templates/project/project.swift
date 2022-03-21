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

let template = Template(
    description: "Tuist Project Template",
    attributes: [
        projectNameAttribute,
        devTeamAttribute,
        bundleIdentifierPrefixAttribute,
        .optional("organization", default: ""),
        .optional("platform", default: "ios"),
    ],
    items: [
        .file(path: "Project.swift", templatePath: "Stencils/project.stencil"),
        .directory(path: "Targets/{{ project }}/Sources", sourcePath: "Stencils/Sources"),
        .directory(path: "Targets/{{ project }}/Resources", sourcePath: "Stencils/Resources"),
        .directory(path: "Targets/{{ project }}/Tests", sourcePath: "Stencils/Tests"),
        .directory(path: "Targets/{{ project }}/UITests", sourcePath: "Stencils/UITests"),
    ]
)
