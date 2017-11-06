// TODO: move this calculations into respective classes

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
