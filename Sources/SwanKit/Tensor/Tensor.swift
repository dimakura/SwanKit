/// Tensor is the main object of SwanKit.
public class SWKTensor<T: Comparable>: CustomStringConvertible {
  /// Storage.
  public let storage: SWKStorage<T>

  /// Tensor size.
  public let size: SWKSize

  /// Storage offset.
  public let offset: Int = 0 // XXX: not sure if we even need this

  /// Storage stride.
  public let stride: SWKStride

  /// Create SWKTensor of given size.
  public init(_ size: SWKSize) {
    self.size = size
    self.stride = SWKStride(size: size)
    storage = SWKStorage<T>(size.capacity)
  }

  /// Create SWKTensor of given dimensions.
  convenience public init(_ dimensions: Int...) {
    self.init(SWKSize(dimensions))
  }

  /// Create SWKTensor from 1D array.
  convenience public init(data arr1: [T]) {
    self.init(calculateSize(arr1))

    for (i, val) in arr1.enumerated() {
      self[i] = val
    }
  }

  /// Create SWKTensor from 2D array.
  convenience public init(data arr2: [[T]]) {
    self.init(calculateSize(arr2))

    for (i, arr1) in arr2.enumerated() {
      for (j, val) in arr1.enumerated() {
        self[i, j] = val
      }
    }
  }

  /// Create SWKTensor from 3D array.
  convenience public init(data arr3: [[[T]]]) {
    self.init(calculateSize(arr3))

    for (i, arr2) in arr3.enumerated() {
      for (j, arr1) in arr2.enumerated() {
        for (k, val) in arr1.enumerated() {
          self[i, j, k] = val
        }
      }
    }
  }

  // TODO: move this to SWKStride
  /// Converts dimension into storage index.
  ///
  /// It uses the following formula for doing so:
  ///
  /// - 1D: storageIndex = offset + index0 * stride0
  /// - 2D: storageIndex = offset + index0 * stride0 + index1 * stride1
  /// - ...
  /// - ND: storageIndex = offset + index0 * stride0 + index1 * stride1 + ... + indexN * strideN
  private func storageIndex(_ indices: [Int]) -> Int {
    return indices.enumerated().reduce(offset) { (acc: Int, indx: (Int, Int)) in acc + indx.1 * stride.dimensions[indx.0] }
  }

  // TODO: move this to SWKSize
  /// Test if given indices are in tensor range.
  private func indexInRange(_ indices: [Int]) -> Bool {
    if indices.count != size.numberOfDimensions {
      return false
    }

    for (i, dimension) in indices.enumerated() {
      if dimension < 0 || dimension > size.dimensions[i] {
        return false
      }
    }

    return true
  }

  public subscript(indices: Int...) -> T {
    get {
      assert(indexInRange(indices), "Indices out of bounds: \(indices)")
      return storage[storageIndex(indices)]
    }

    set {
      assert(indexInRange(indices), "Indices out of bounds: \(indices)")
      storage[storageIndex(indices)] = newValue
    }
  }

  /// Represent this size as a String.
  public var description: String {
    return "SWKTensor<\(T.self)> [\(size)]"
  }
}

/// Calculates size for 1-dimensional array.
private func calculateSize<T>(_ arr1: [T]) -> SWKSize {
  return SWKSize(arr1.count)
}

/// Calculates size for 2-dimensional array.
private func calculateSize<T>(_ arr2: [[T]]) -> SWKSize {
  let d1 = arr2.count
  let d2 = d1 > 0 ? arr2[0].count : 0
  guard d1 > 0 && d2 > 0 else { return SWKSize() }
  return SWKSize(d1, d2)
}

/// Calculates size for 3-dimensional array.
private func calculateSize<T>(_ arr3: [[[T]]]) -> SWKSize {
  let d1 = arr3.count
  let d2 = d1 > 0 ? arr3[0].count : 0
  let d3 = d2 > 0 ? arr3[0][0].count : 0
  guard d1 > 0 && d2 > 0 && d3 > 0 else { return SWKSize() }
  return SWKSize(d1, d2, d3)
}
