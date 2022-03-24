//
//  tuist.swift
//  ProjectDescriptionHelpers
//
//  Created by Thimo Bess on 21.03.22.
//

import ProjectDescription

let packageNameAttribute: Template.Attribute = .required("name")

func templatePath(_ path: String) -> Path {
    "Stencils/\(path)"
}

func packagesPath(_ path: String) -> String {
    "Packages/\(packageNameAttribute)/\(path)"
}

let template = Template(
    description: "Tuist Project Template",
    attributes: [
        packageNameAttribute,
    ],
    items: [
        .file(path: packagesPath("Package.swift"), 
              templatePath: templatePath("package.stencil")
        ),
    ]
)
