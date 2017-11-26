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
      name: "AST",
      dependencies: []),
    .target(
      name: "Generator",
      dependencies: [
        "AST"
      ]),
    .target(
      name: "SwanKit",
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
