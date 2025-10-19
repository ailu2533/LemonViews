// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LemonViews",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LemonViews",
            targets: ["LemonViews"]
        )
    ],
    dependencies: [
//        .package(url: "https://github.com/SwiftUIX/SwiftUIX", .upToNextMajor(from: "0.2.2")),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git", exact: "6.2.0"),
//        .package(url: "https://github.com/siteline/swiftui-introspect.git", .upToNextMajor(from: "1.3.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LemonViews",
            dependencies: [
//                .product(name: "SwiftUIX", package: "SwiftUIX"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
//                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect")
            ],
            resources: [
                .process("Resources")
            ]
        )
//        .testTarget(
//            name: "LemonViewsTests",
//            dependencies: ["LemonViews"]
//        ),
    ]
)
