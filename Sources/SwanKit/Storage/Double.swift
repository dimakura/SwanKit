import Accelerate

extension SWKStorage where T == Double {
  /// In-place sine function.
  public func sin_() {
    vvsin(storage, storage, &size32)
  }
}
