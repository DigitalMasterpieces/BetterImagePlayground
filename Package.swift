// swift-tools-version: 6.0


import PackageDescription

let package = Package(
    name: "BetterImagePlayground",
    platforms: [.iOS(.v18), .macOS(.v15), .macCatalyst(.v18)],
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
