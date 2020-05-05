// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let testTarget = PackageDescription.Target.testTarget(name: "TraktSwiftTests", dependencies: ["TraktSwift"])

let package = Package(
    name: "TraktSwift",
    platforms: [.iOS(.v8), .tvOS(.v9), .watchOS(.v2), .macOS(.v10_10)],
    products: [
        .library(name: "TraktSwift", targets: ["TraktSwift"]),
    ],
    targets: [
        .target(name: "TraktSwift"),
        testTarget,
    ],
    swiftLanguageVersions: [.v5]
)
