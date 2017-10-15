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

You create `SWKSize` by listing all dimension sizes to initializer:

```swift
let size = SWKSize(5, 3)
size.capacity // 15
````

`dimensions` property gives dimensionality of `SWKSize` instance:

```swift
size.dimensions // 2
```

You can access size of a dimension using subscript operator:

```swift
size[0] // 5
size[1] // 3
```

Or using properties `x` and `y` for two initial dimensions:

```swift
size.x // 5
size.y // 3
```

There are also `z` and `t` properties for third and forth dimensions:

```swift
size.z // Throws Index out of range exception
size.t // Throws Index out of range exception
```
*/
public class SWKSize {

  private let _dimensions: [Int]
  public let capacity: Int

  /// Creates instance of `SWKSize`.
  public init(_ dimensions: Int...) {
    _dimensions = dimensions
    capacity = dimensions.reduce(1, *)
  }

  public subscript(index: Int) -> Int {
    return _dimensions[index]
  }

  /// Dimensionality of this size.
  public var dimensions: Int {
    return _dimensions.count
  }

  /// Size accross first dimension.
  public var x: Int {
    return _dimensions[0]
  }

  /// Size accross second dimension.
  public var y: Int {
    return _dimensions[1]
  }

  /// Size accross third dimension.
  public var z: Int {
    return _dimensions[2]
  }

  /// Size accross forth dimension.
  public var t: Int {
    return _dimensions[3]
  }

}
