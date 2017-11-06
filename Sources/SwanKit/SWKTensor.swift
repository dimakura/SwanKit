public class SWKTensor<T: Comparable>: CustomStringConvertible {
  /// Storage.
  public let storage: SWKStorage<T>

  /// Tensor size.
  public let size: SWKSize

  /// Storage offset.
  public let offset: Int = 0 // XXX: not sure if we even need this

  /// Storage stride.
  public let stride: [Int]

  /// Create SWKTensor of given size.
  public init(_ size: SWKSize) {
    self.size = size
    self.stride = calculateStride(size.dimensions)
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

  /// Converts given dimension into storage index.
  ///
  /// It uses the following formula for doing so:
  ///
  /// - 1D: storageIndex = offset + index0 * stride0
  /// - 2D: storageIndex = offset + index0 * stride0 + index1 * stride1
  /// - ...
  /// - ND: storageIndex = offset + index0 * stride0 + index1 * stride1 + ... + indexN * strideN
  private func storageIndex(_ indices: [Int]) -> Int {
    return indices.enumerated().reduce(offset) { (acc: Int, indx: (Int, Int)) in acc + indx.1 * stride[indx.0] }
  }

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

/// Byte tensor.
public typealias SWKByteTensor   = SWKTensor<SWKByte>

/// Short tensor.
public typealias SWKShortTensor  = SWKTensor<SWKShort>

/// Int tensor.
public typealias SWKIntTensor    = SWKTensor<SWKInt>

/// Long tensor.
public typealias SWKLongTensor   = SWKTensor<SWKLong>

/// Float tensor.
public typealias SWKFloatTensor  = SWKTensor<SWKFloat>

/// Double tensor.
public typealias SWKDoubleTensor = SWKTensor<SWKDouble>
