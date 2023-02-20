// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CoreModels",
            targets: ["CoreModels"]
        ),
        .library(
            name: "CoreServices",
            targets: ["CoreServices"]
        ),
        .library(
            name: "CoreUseCases",
            targets: ["CoreUseCases"]
        )
    ],
    dependencies: [
        .package(path: "../Utils"),
        .package(path: "../Config"),
        .package(path: "../Networking"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "10.4.0")
    ],
    targets: [
        .target(
            name: "CoreModels",
            dependencies: [
                "Utils",
                "Config"
            ]
        ),
        .target(
            name: "CoreServices",
            dependencies: [
                "Utils",
                "Config",
                "Networking",
                "CoreModels",
                .product(name: "FirebaseDatabase", package: "firebase-ios-sdk")
            ]
        ),
        .target(
            name: "CoreUseCases",
            dependencies: [
                "Utils",
                "Networking",
                "CoreModels",
                "CoreServices",
            ]
        )
    ]
)
