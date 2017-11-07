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

  public subscript(indices: Int...) -> T {
    get {
      assert(size.indexInRange(indices), "Indices out of bounds: \(indices)")
      let index = stride.storageIndex(offset: offset, indices: indices)
      return storage[index]
    }

    set {
      assert(size.indexInRange(indices), "Indices out of bounds: \(indices)")
      let index = stride.storageIndex(offset: offset, indices: indices)
      storage[index] = newValue
    }
  }

  /// Transpose this tensor.
  public func transpose(dim1: Int = 0, dim2: Int = 1) {
    stride.transpose(dim1: dim1, dim2: dim2)
    size.transpose(dim1: dim1, dim2: dim2)
  }

  /// Is storage for this tensor contiguous?
  public func isContiguous() -> Bool {
    return stride.isContiguous(size: size)
  }

  /// Is tensor transposed?
  public func isTransposed() -> Bool {
    if isContiguous() { return false }

    var maxStride = 1
    var sizeMaxStride = 1
    var z = 1

    for d in 0..<size.numberOfDimensions {
      if stride[d] == 0 && size[d] != 1 {
        return false
      }

      if stride[d] > maxStride {
        maxStride = stride[d]
        sizeMaxStride = size[d]
      }

      z *= size[d]
    }

    return z == maxStride * sizeMaxStride
  }

  // TODO: isTransposed
  // TODO: clone

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
