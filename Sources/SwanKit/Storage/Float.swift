import Accelerate

extension SWKStorage where T == Float {
  /// In-place sinus.
  public func sin_() {
    vvsinf(storage, storage, &size32)
  }
}
