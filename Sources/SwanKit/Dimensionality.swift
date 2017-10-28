//
// SwanKit
// Dimensionality.swift
//
// Created by Dimitri Kurashvili on 2017-10-16
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

/// Cut array on the first zero member.
///
/// ```swift
/// cutDimensions([0, 2, 3]) // returns []
/// cutDimensions([1, 0, 3]) // returns [1]
/// cutDimensions([1, 2, 0]) // returns [1, 2]
/// cutDimensions([1, 2, 3]) // returns [1, 2, 3]
/// ```
func cutDimensions(_ dimensions: [Int]) -> [Int] {
  let cutOnIndex = dimensions.index { x in x < 1 } ?? dimensions.count
  return [Int](dimensions[0..<cutOnIndex])
}

/// Calculates stride for given dimensions.
func calculateStride(_ dimensions: [Int]) -> [Int] {
  guard !dimensions.isEmpty else { return [Int]() }
  var strides = [Int](repeating: 1, count: dimensions.count)
  for index in (0..<dimensions.count-1).reversed() {
    strides[index] *= strides[index + 1] * dimensions[index + 1]
  }
  return strides
}

/// Calculates size for 1-dimensional array.
func calculateSize<T>(_ arr1: [T]) -> SWKSize {
  return SWKSize(arr1.count)
}

/// Calculates size for 2-dimensional array.
func calculateSize<T>(_ arr2: [[T]]) -> SWKSize {
  let d1 = arr2.count
  let d2 = d1 > 0 ? arr2[0].count : 0
  guard d1 > 0 && d2 > 0 else { return SWKSize() }
  return SWKSize(d1, d2)
}

/// Calculates size for 3-dimensional array.
func calculateSize<T>(_ arr3: [[[T]]]) -> SWKSize {
  let d1 = arr3.count
  let d2 = d1 > 0 ? arr3[0].count : 0
  let d3 = d2 > 0 ? arr3[0][0].count : 0
  guard d1 > 0 && d2 > 0 && d3 > 0 else { return SWKSize() }
  return SWKSize(d1, d2, d3)
}
