import Foundation


/**
A `SWKStorage` is a contiguous, one-dimensional array of a single data type.
*/
struct SWKStorage<T> {
  // Implement CPU-based non-sparse storage
  //
  // TODO list:
  //
  // 01 .Initializer by size (integer)
  // 02. Initializer from array (data)
  // 03. size => size of the array, 0 should be acceptable
  // 04. elementSize => size of the element (e.g. MemoryLayout<Int>.size)
  // 05. toArray (?) => like tolist in PyTorch
  // 06. isCPU => for now always TRUE
  // 07. isGPU => for now always FALSE
  // 08. free storage (some Swift mechanics for destroy?) https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Deinitialization.html
  // 09. retain => +1 element (?) see THStorage_(retain)
  // 10. resize_ => resize to a new size (only when resizable?)
  // 11. fill => fill all the storage with given value
  // 12. get/set value at specified index (subscript)
  // 13. share_memory_ => move to be shared among processes (?)
  // More?
  // XXX: It's not clear if Swift implementation will be performan enough

}

/// Byte storage.
typealias SWKByteStorage  = SWKStorage<Int8>

/// Character storage.
typealias SWKCharStorage  = SWKStorage<Character>

/// Short storage.
typealias SWKShortStorage = SWKStorage<Int16>

/// Int storage.
typealias SWKIntStorage   = SWKStorage<Int32>

/// Long storage.
typealias SWKLongStorage  = SWKStorage<Int64>


// typealias SWKHalfStorage   = ?

/// Float storage.
typealias SWKFloatStorage  = SWKStorage<Float>

/// Double storage.
typealias SWKDoubleStorage = SWKStorage<Double>
