import Accelerate

extension SWKStorage where T == Double {
  /// Sine function.
  public func sin() -> SWKStorage<T> {
    return cloneWith { newStorage in
      vvsin(newStorage.storage, storage, &size32)
    }
  }

  /// In-place sine function.
  public func sin_() {
    vvsin(storage, storage, &size32)
  }
}
