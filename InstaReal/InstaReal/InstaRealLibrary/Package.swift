// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLibrary",
    platforms: [
      .iOS(.v16),
    ],
    products: [
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
        .library(name: "Models", targets: ["Models"]),
        .library(name: "Home", targets: ["Home"]),
        .library(name: "Search", targets: ["Search"]),
        .library(name: "Account", targets: ["Account"]),
        .library(name: "ApiClient", targets: ["ApiClient"]),
        .library(name: "Utils", targets: ["Utils"]),
        .library(name: "Router", targets: ["Router"]),
        .library(name: "PostDetail", targets: ["PostDetail"]),
        .library(name: "UUIDClient", targets: ["UUIDClient"]),
        .library(name: "DI", targets: ["DI"]),
        .library(name: "TestUtils", targets: ["TestUtils"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Nuke", exact: "12.8.0"),
        .package(url: "https://github.com/EmergeTools/Pow", exact: "1.0.5")
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [
                .byName(name: "Pow"),
                .product(name: "NukeUI", package: "Nuke"),
            ],
            resources: [
                .process("Resources/")
            ]
        ),
        .target(
            name: "Models"
        ),
        .target(
            name: "Home",
            dependencies: [
                "DesignSystem",
                "ApiClient",
                "Models",
                "Utils",
                "UUIDClient",
                "Router",
                "DI"
            ]
        ),
        .testTarget(
            name: "HomeTests",
            dependencies: [
                "Home",
                "TestUtils"
            ]
        ),
        .target(
            name: "Search",
            dependencies: [
                "DesignSystem",
                "Utils",
            ]
        ),
        .target(
            name: "Account",
            dependencies: [
                "DesignSystem",
                "Utils"
            ]
        ),
        .target(
            name: "ApiClient",
            resources: [.process(
                "Resources/"
            )]
        ),
        .target(
            name: "Utils"
        ),
        .target(
            name: "Router"
        ),
        .target(
            name: "PostDetail",
            dependencies: [
                "DesignSystem",
                "ApiClient",
                "Models",
                "Utils",
                "DI",
                .product(name: "NukeUI", package: "Nuke"),
            ]
        ),
        .target(
            name: "UUIDClient"
        ),
        .target(
            name: "DI",
            dependencies: [
                "ApiClient",
                "UUIDClient"
            ]
        ),
        .target(
            name: "TestUtils",
            dependencies: [
                "ApiClient",
                "UUIDClient"
            ]
        ),
    ]
)
