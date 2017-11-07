/// We use stride to convert tensor indices to storage indices.
public class SWKStride: SWKDimensinal {
  /// Creates stride from size.
  /// You should usually use this constructor.
  public init(size: SWKSize) {
    super.init(calculateStride(size.dimensions))
  }
}

/// Converts size dimensions into stride dimensions.
///
/// Example:
///   calculateStride([1, 2])     // [2, 1]
///   calculateStride([1, 2, 3])  // [6, 3, 1]
private func calculateStride(_ dimensions: [Int]) -> [Int] {
  if dimensions.isEmpty { return [Int]() }
  var strides = [Int](repeating: 1, count: dimensions.count)
  for index in (0..<dimensions.count-1).reversed() {
    strides[index] *= strides[index + 1] * dimensions[index + 1]
  }
  return strides
}
