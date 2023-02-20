// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "HomeFeature",
            targets: ["HomeFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/quickbirdstudios/XCoordinator.git", from: "2.2.0"),
        .package(path: "../Utils"),
        .package(path: "../CommonUI"),
        .package(path: "../Core"),
    ],
    targets: [
        .target(
            name: "HomeFeature",
            dependencies: [
                "XCoordinator",
                .product(name: "CommonResources", package: "CommonUI"),
                .product(name: "CommonUIComponents", package: "CommonUI"),
                .product(name: "CommonUIUtils", package: "CommonUI"),
                .product(name: "CoreModels", package: "Core"),
                .product(name: "CoreServices", package: "Core"),
                .product(name: "CoreUseCases", package: "Core")
            ]),
        .testTarget(
            name: "HomeFeatureTests",
            dependencies: ["HomeFeature"]),
    ]
)
