import Accelerate

extension SWKStorage where T == Float {
  /// Sine function.
  public func sin() -> SWKStorage<T> {
    return cloneWith { newStorage in
      vvsinf(newStorage.storage, storage, &size32)
    }
  }

  /// In-place sine function.
  public func sin_() {
    vvsinf(storage, storage, &size32)
  }
}
