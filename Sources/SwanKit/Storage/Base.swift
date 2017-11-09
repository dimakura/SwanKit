/// You don't usually create `SWKStorage` as it's automatically allocated in tensors.
/// In case you still need to create storage yourself, there are two ways how to do it:
///
/// ```swift
/// // 1. Creates uninitialized storage of size 10
/// var storage = SWKStorage(10)
///
/// // 2. Creates storage of size 4 with elements initialized from the array
/// var storage = SWKStorage([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
///
/// // Some properties of the storage.
/// print(storage.size)        // 10 -- number of elements
/// print(storage.elementSize) // 4 -- bytes taken by each element
/// print(storage[5])          // 6.0 -- value of the 6th element
/// ```
public class SWKStorage<T> {
  var storage: UnsafeMutablePointer<T>
  var _size: Int
  var _device: SWKDevice?

  /// Creates uninitialized storage of given size.
  public init(_ size: Int) {
    _size = size
    storage = UnsafeMutablePointer<T>.allocate(capacity: size)
  }

  /// Creates storage from the given array.
  convenience public init(_ data: [T]) {
    self.init(data.count)

    // XXX: not optimal!
    for i in 0..<_size {
      storage[i] = data[i]
    }
  }

  deinit {
    // Swift counts referecences for us 🎉.
    // All we need todo is to free the allocated memory.
    storage.deallocate(capacity: _size)
  }

  private func indexInRange(_ index: Int) -> Bool {
    return index >= 0 && index < size
  }

  public subscript(index: Int) -> T {
    get {
      assert(indexInRange(index), "Index out of bounds: \(index)")
      return storage[index]
    }
    set {
      assert(indexInRange(index), "Index out of bounds: \(index)")
      storage[index] = newValue
    }
  }

  /// Size as Int32.
  var size32: Int32 {
    get {
      return Int32(_size)
    }

    set {
      _size = Int(truncatingIfNeeded: newValue)
    }
  }

  func cloneWith(_ initializer: (SWKStorage<T>) -> Void) ->  SWKStorage<T> {
    let storage = SWKStorage(size)
    initializer(storage)
    return storage
  }

  /// Number of elements in this storage.
  public var size: Int {
    return _size
  }

  /// Number of bytes occupied by single element.
  public var elementSize: Int {
    return MemoryLayout<T>.stride
  }

  /// Current device for this store.
  public var device: SWKDevice {
    get {
      return _device ?? SWKConfig.currentDevice
    }

    set {
      _device = newValue
    }
  }

  /// Is storage reeady for CPU?
  public var isCPU: Bool {
    return device.isCPU
  }

  /// Is storage reeady for GPU?
  public var isGPU: Bool {
    return device.isGPU
  }

  /// Converts this storage for use with CPU.
  public func cpu() -> SWKStorage<T> {
    fatalError("Not implemented", file: #file, line: #line)
  }

  /// Converts this storage for use with GPU.
  public func gpu(device: SWKDevice = .Metal) -> SWKStorage<T> {
    fatalError("Not implemented", file: #file, line: #line)
  }

  /// Fills storage with same value.
  public func fill(_ value: T) {
    // XXX: not optimal!
    for i in 0..<size {
      storage[i] = value
    }
  }
}

extension SWKStorage where T: SignedNumeric {
  /// Fills storage with zeros.
  public func zeros() {
    fill(0)
  }

  /// Fills storage with ones.
  public func ones() {
    fill(1)
  }
}
