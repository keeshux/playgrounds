// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CarGame",
    targets: [
        .target(
            name: "CarCore"
        ),
        .target(
            name: "SimpleCar",
            dependencies: ["CarCore"]
        ),
        .testTarget(
            name: "SimpleCarTests",
            dependencies: ["SimpleCar"]
        ),
        .executableTarget(
            name: "CarGame",
            dependencies: ["SimpleCar"]
        )
    ]
)
