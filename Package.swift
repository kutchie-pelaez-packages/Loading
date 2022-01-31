// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "Loading",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(
            name: "LoadingManager",
            targets: [
                "LoadingManager"
            ]
        ),
        .library(
            name: "LoadingOverlay",
            targets: [
                "LoadingOverlay"
            ]
        ),
        .library(
            name: "LoadingView",
            targets: [
                "LoadingView"
            ]
        )
    ],
    dependencies: [
        .package(name: "Core", url: "https://github.com/kutchie-pelaez-packages/Core.git", .branch("master")),
        .package(name: "CoreUI", url: "https://github.com/kutchie-pelaez-packages/CoreUI.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "LoadingManager",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "CoreUI", package: "CoreUI"),
                .target(name: "LoadingOverlay"),
                .target(name: "LoadingView")
            ]
        ),
        .target(
            name: "LoadingOverlay",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "CoreUI", package: "CoreUI"),
                .target(name: "LoadingView")
            ]
        ),
        .target(
            name: "LoadingView",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "CoreUI", package: "CoreUI")
            ]
        )
    ]
)
