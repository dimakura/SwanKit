//
// SwanKit
// SWKSize.swift
//
// Created by Dimitri Kurashvili on 2017-10-13
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

/**
`SWKSize` describes tensor size across available dimensions.

```swift
let size = SWKSize(5, 3)
size.capacity // 15
````
*/
public class SWKSize : CustomStringConvertible {

  private let _dimensions: [Int]

  /// How many elements can tensor of this size contain?
  public  let capacity:    Int

  /// Creates instance of `SWKSize`.
  public init(_ dimensions: [Int]) {
    _dimensions = SWK_cutDimensions(dimensions)
    capacity = _dimensions.isEmpty ? 0 : _dimensions.reduce(1, *)
  }

  /// Creates instance of `SWKSize`.
  convenience public init(_ dimensions: Int...) {
    self.init(dimensions)
  }

  public subscript(index: Int) -> Int {
    return _dimensions[index]
  }

  /// Dimensionality of this size.
  public var dimensions: Int {
    return _dimensions.count
  }

  /// Empty size?
  public var isEmpty: Bool {
    return _dimensions.isEmpty
  }

  public var description: String {
    return _dimensions.map({"\($0)"}).joined(separator: "x")
  }

}
