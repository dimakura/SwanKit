// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "SwanKit",

  products: [
    .library(
      name: "SwanKit",
      targets: ["SwanKit"]),
  ],

  dependencies: [
    .package(url: "https://github.com/dimakura/SSpec", from: "0.2.3")
  ],

  targets: [
    .target(
      name: "SwanKit",
      dependencies: []),
    .target(
      name: "AST",
      dependencies: []),
    .testTarget(
      name: "AllTests",
      dependencies: [
        "AST",
        "SwanKit",
        "SSpec"
      ]),
  ]
)
