// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReerJSONBenchmark",
    platforms: [
        .macOS(.v15),
    ],
    dependencies: [
        .package(url: "https://github.com/reers/ReerJSON.git", branch: "main"),
        .package(url: "https://github.com/michaeleisel/ZippyJSON.git", from: "1.2.15"),
        .package(url: "https://github.com/orlandos-nl/IkigaJSON.git", from: "2.3.2")
    ],
    targets: [
        .executableTarget(
            name: "ReerJSONBenchmark",
            dependencies: [
                .product(name: "ReerJSON", package: "ReerJSON" ),
                .product(name: "ZippyJSON", package: "ZippyJSON"),
                .product(name: "IkigaJSON", package: "IkigaJSON")
            ],
            resources: [
                .copy("github_events.json"),
                .copy("twitter.json"),
                .copy("apache_builds.json"),
                .copy("canada.json"),
                .copy("random.json"),
            ]
        ),
    ]
)
