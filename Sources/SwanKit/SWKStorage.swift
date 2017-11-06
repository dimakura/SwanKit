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
  // https://developer.apple.com/documentation/swift/unsafemutablepointer
  // https://developer.apple.com/documentation/swift/unsafemutablebufferpointer
  private var _ptr: UnsafeMutablePointer<T>
  private var _buffer: UnsafeMutableBufferPointer<T>

  fileprivate var _device: SWKDevice?

  /// Creates uninitialized storage of given size.
  public init(_ size: Int) {
    _ptr = UnsafeMutablePointer<T>.allocate(capacity: size)
    _buffer = UnsafeMutableBufferPointer(start: _ptr, count: size)
  }

  /// Creates storage from the given array.
  convenience public init(_ data: [T]) {
    self.init(data.count)
    _ = _buffer.initialize(from: data)
  }

  deinit {
    // Swift counts referecences for us 🎉. All we need todo is to free the allocated memory.
    _ptr.deallocate(capacity: size)
  }

  private func indexInRange(_ index: Int) -> Bool {
    return index >= 0 && index < size
  }

  public subscript(index: Int) -> T {
    get {
      assert(indexInRange(index), "Index out of bounds: \(index)")
      return _buffer[index]
    }
    set {
      assert(indexInRange(index), "Index out of bounds: \(index)")
      _buffer[index] = newValue
    }
  }

  /// Number of elements in this storage.
  public var size: Int {
    return _buffer.count
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
    for i in 0..<size {
      _buffer[i] = value
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

/// Byte storage.
public typealias SWKByteStorage  = SWKStorage<Int8>

/// Short storage.
public typealias SWKShortStorage = SWKStorage<Int16>

/// Int storage.
public typealias SWKIntStorage   = SWKStorage<Int32>

/// Long storage.
public typealias SWKLongStorage  = SWKStorage<Int64>

/// Float storage.
public typealias SWKFloatStorage  = SWKStorage<Float>

/// Double storage.
public typealias SWKDoubleStorage = SWKStorage<Double>
