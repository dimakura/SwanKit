//
// SWKSize.swift
//
// Created by Dimitri Kurashvili on 2017-10-13
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

/**
`SWKSize` describes size of a tensor across available dimensions.

To create `SWKSize` of size `5x3`:

```swift
let size = SWKSize(5, 3)
````

**Note**: `SWKSize` is an immutable data structure: once created you cannot change its properties.

You can access dimensionality of `SWKSize` instance using `dimensions` property:

```swift
size.dimensions // 2
```

You can access size of a dimension using subscripts:

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
size.z // Throws out of index exception
size.t // Throws out of index exception
```
*/
struct SWKSize {

  private let _dimensions: [Int]

  /// Creates instance of `SWKSize`.
  init(_ dimensions: Int...) {
    _dimensions = dimensions
  }

  subscript(index: Int) -> Int {
    get {
      return _dimensions[index]
    }
  }

  /// Dimensionality of this size.
  var dimensions: Int {
    get {
      return _dimensions.count
    }
  }

  /// Size accross first dimension.
  var x: Int {
    get {
      return _dimensions[0]
    }
  }

  /// Size accross second dimension.
  var y: Int {
    get {
      return _dimensions[1]
    }
  }

  /// Size accross third dimension.
  var z: Int {
    get {
      return _dimensions[2]
    }
  }

  /// Size accross forth dimension.
  var t: Int {
    get {
      return _dimensions[3]
    }
  }

}
