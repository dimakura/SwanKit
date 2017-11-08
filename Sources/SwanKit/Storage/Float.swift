import Accelerate

extension SWKStorage where T == Float {
  /// In-place sine function.
  public func sin_() {
    vvsinf(storage, storage, &size32)
  }
}
