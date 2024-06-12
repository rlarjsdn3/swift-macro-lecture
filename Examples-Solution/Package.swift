// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "swift-macro-lecture",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the libraries a package produces, making them visible to other packages.
        .library(
            name: "Macros",
            targets: ["MacrosInterface"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactorKit/ReactorKit.git", from: "3.2.0"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // Macro implementation that performs the source transformation of a macro.
        .macro(
            name: "MacrosImplementation",
            dependencies: [
                "SyntaxHelper",
                .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ],
            path: "Sources/Macros/Implementation"
        ),

        // Library that exposes a macro as part of its API, which is used in client programs.
        .target(
            name: "MacrosInterface",
            dependencies: [
                "MacrosImplementation",
                .product(name: "ReactorKit", package: "ReactorKit")
            ],
            path: "Sources/Macros/Interfaces"
        ),

        // A client of the library, which is able to use the macro in its own code.
        .executableTarget(
            name: "MacrosPlayground",
            dependencies: ["MacrosInterface"],
            path: "Sources/Macros/Playground"
        ),
        
        // Syntax Tree를 구성하는 데 도움을 주는 Target
        .target(
            name: "SyntaxHelper",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax")
            ],
            path: "Sources/SyntaxHelper"
        ),

        // A test target used to develop the macro implementation.
        .testTarget(
            name: "MacrosTest",
            dependencies: [
                "MacrosImplementation",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
