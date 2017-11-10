// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwanKit",

  products: [
    .library(
      name: "SwanKit",
      targets: ["SwanKit"]
    ),

    .library(
      name: "AST",
      targets: ["AST"]
    ),

    .executable(
      name: "Generator",
      targets: ["Generator"]
    )
  ],

  dependencies: [
    .package(url: "https://github.com/dimakura/SSpec", from: "0.2.3"),
  ],

  targets: [
    .target(
      name: "SwanKit",
      dependencies: []
    ),

    .target(
      name: "AST",
      dependencies: []
    ),

    .target(
      name: "Generator",
      dependencies: ["AST"]
    ),

    .testTarget(
      name: "SwanKitTests",
      dependencies: ["SwanKit", "SSpec"]
    ),

    .testTarget(
      name: "ASTTests",
      dependencies: ["AST", "SSpec"]
    ),
  ]
)
