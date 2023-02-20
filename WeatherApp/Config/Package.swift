// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Config",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Config",
            targets: ["Config"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Config",
            dependencies: []),
        .testTarget(
            name: "ConfigTests",
            dependencies: ["Config"]),
    ]
)
