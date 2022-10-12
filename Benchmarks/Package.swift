// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "data-structures.Benchmarks",
    products: [
    //        // Products define the executables and libraries a package produces, and make them visible to other packages.
    //        .library(
    //            name: "Benchmarks",
    //            targets: ["Benchmarks"]),
        .executable(name: "data-structures-benchmark", targets: ["benchmark"]),
    ],
    dependencies: [
        .package(name: "data-structures", path: ".."),
        .package(url: "https://github.com/apple/swift-collections-benchmark", from: "0.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Benchmarks",
            dependencies: [
                .product(name: "DataStructures", package: "data-structures"),
                .product(name: "CollectionsBenchmark", package: "swift-collections-benchmark"),
            ],
            path: "Benchmarks"
        ),
        .executableTarget(
            name: "benchmark",
            dependencies: [
                "Benchmarks",
            ],
            path: "benchmark-tool"
        ),
    ]
)
