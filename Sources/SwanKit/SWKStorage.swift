//
// SwanKit
// SWKStorage.swift
//
// Created by Dimitri Kurashvili on 2017-10-14
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

/// Generic storage type.
///
/// See `SWKStorage` for details.
public class SWKStorageBase<T> {

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

  public subscript(index: Int) -> T {
    get {
      assert(index >= 0 && index < size, "Index out of bounds: \(index)", file: #file, line: #line)
      return _buffer[index]
    }
    set {
      assert(index >= 0 && index < size, "Index out of bounds: \(index)", file: #file, line: #line)
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
    if let dev = _device {
      return dev;
    }

    return SWKDevice.currentDevice
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
  public func cpu() -> SWKStorageBase<T> {
    fatalError("Not implemented", file: #file, line: #line)
  }

  /// Converts this storage for use with GPU.
  public func gpu(device: SWKDevice = .Metal) -> SWKStorageBase<T> {
    fatalError("Not implemented", file: #file, line: #line)
  }

}

/// Byte storage.
public typealias SWKByteStorage  = SWKStorageBase<Int8>

/// Short storage.
public typealias SWKShortStorage = SWKStorageBase<Int16>

/// Int storage.
public typealias SWKIntStorage   = SWKStorageBase<Int32>

/// Long storage.
public typealias SWKLongStorage  = SWKStorageBase<Int64>

// typealias SWKHalfStorage   = ?

/// Float storage.
public typealias SWKFloatStorage  = SWKStorageBase<Float>

/// Double storage.
public typealias SWKDoubleStorage = SWKStorageBase<Double>

/**
A `SWKStorage` is collection of `Float` data type.

There are also predefined storages for other primitive data types:

- `SWKByteStorage`, corresponding to Swift's `Int8` type;
- `SWKShortStorage`, corresponding to Swift's `Int16` type;
- `SWKIntStorage`, corresponding to Swift's `Int32` type;
- `SWKLongStorage`, corresponding to Swift's `Int64` type;
- `SWKFloatStorage` (same as `SWKStorage`), corresponding to Swift's `Float` type;
- `SWKDoubleStorage`, corresponding to Swift's `Double` type.

You don't usually create `SWKStorage` as it's automatically allocated in tensors.
In case you still need to create storage yourself, there are two ways how to do it:

```swift
// 1. Creates uninitialized storage of size 10
var storage = SWKStorage(10)

// 2. Creates storage of size 4 with elements initialized from the array
var storage = SWKStorage([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

// Some properties of the storage.
print(storage.size)        // 10 -- number of elements
print(storage.elementSize) // 4 -- bytes taken by each element
print(storage[5])          // 6.0 -- value of the 6th element
```
*/
public typealias SWKStorage = SWKFloatStorage
