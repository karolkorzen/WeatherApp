// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Routes",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Routes",
            targets: ["Routes"]),
    ],
    dependencies: [
        .package(url: "https://github.com/quickbirdstudios/XCoordinator.git", from: "2.2.0"),
    ],
    targets: [
        .target(
            name: "Routes",
            dependencies: [
                "XCoordinator"
            ]),
        .testTarget(
            name: "RoutesTests",
            dependencies: ["Routes"]),
    ]
)
