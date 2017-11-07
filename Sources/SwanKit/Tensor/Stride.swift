/// We use stride to convert tensor indices to storage indices.
public class SWKStride: SWKDimensional {
  /// Creates stride from size.
  /// You should usually use this constructor.
  public init(size: SWKSize) {
    super.init(calculateStride(size.dimensions))
  }

  /// Converts tensor index to storage index.
  ///
  /// This method uses the following formula for doing so:
  ///
  /// - 1-D array: `storageIndex = offset + index_0 * stride_0`
  /// - 2-D array: `storageIndex = offset + index_0 * stride_0 + index_1 * stride_1`
  /// - ...
  /// - n-D array: `storageIndex = offset + index_0 * stride_0 + index_1 * stride_1 + ... + index_n * stride_n`
  public func storageIndex(offset: Int, indices: [Int]) -> Int {
    return indices.enumerated().reduce(offset) { (acc: Int, index: (Int, Int)) in acc + index.1 * dimensions[index.0] }
  }

  /// Does this stride correspond to contigious storage?
  public func isContiguous(size: SWKSize) -> Bool {
    // More efficient way would be to make loop and exit on first mistmatch
    // instead of comparing full stride dimensions.
    return calculateStride(size.dimensions) == dimensions
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
