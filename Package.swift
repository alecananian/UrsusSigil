// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UrsusSigil",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "UrsusSigil", targets: ["UrsusSigil"]),
    ],
    dependencies: [
        .package(name: "SwiftSVG",
                 url: "https://github.com/mchoe/SwiftSVG",
                 from: "2.3.2"),
        .package(name: "UrsusAtom",
                 url: "https://github.com/alecananian/UrsusAtom",
                 from: "1.3.0"),
    ],
    targets: [
        .target(
            name: "UrsusSigil",
            dependencies: [
                .byName(name: "SwiftSVG"),
                .byName(name: "UrsusAtom")
            ],
            resources: [
                .process("index.json")
            ]),
    ]
)
