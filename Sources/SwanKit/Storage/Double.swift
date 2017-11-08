import Accelerate

extension SWKStorage where T == Double {
  /// In-place sinus.
  public func sin_() {
    vvsin(storage, storage, &size32)
  }
}
