//
// SwanKit
// Dimensionality.swift
//
// Created by Dimitri Kurashvili on 2017-10-16
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

/**
Cut dimensions on the first non-zero dimension.

```swift
SWK_cutDimensions([0, 2, 3]) // returns []
SWK_cutDimensions([1, 0, 3]) // returns [1]
SWK_cutDimensions([1, 2, 0]) // returns [1, 2]
SWK_cutDimensions([1, 2, 3]) // returns [1, 2, 3]
```
*/
func SWK_cutDimensions(_ dimensions: [Int]) -> [Int] {
  let cutOnIndex = dimensions.index { x in x < 1 } ?? dimensions.count
  return [Int](dimensions[0..<cutOnIndex])
}
