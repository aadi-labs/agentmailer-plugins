// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "AgentMailer",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "AgentMailer",
            targets: ["AgentMailer"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AgentMailer",
            path: "Sources"
        ),
        .testTarget(
            name: "AgentMailerTests",
            dependencies: ["AgentMailer"],
            path: "Tests"
        )
    ]
)
