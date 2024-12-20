// swift-tools-version: 6.0


import PackageDescription

let package = Package(
    name: "BetterImagePlayground",
    products: [
        .library(
            name: "BetterImagePlayground",
            targets: ["BetterImagePlayground"]),
    ],
    targets: [
        .target(
            name: "BetterImagePlayground"),
    ]
)
