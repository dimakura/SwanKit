// NB: This file is autogenerated from `generate/math.swift`. Don't change it manually.

import Accelerate

/// SWKStorage extensions for Double.
extension SWKStorage where T == Double {
  /// Cloning sine function.
  public func sin() -> SWKStorage<T> {
    return cloneWith { newStorage in
      vvsin(newStorage.storage, storage, &size32)
    }
  }

  /// In-place sine function.
  public func sin_() {
    vvsin(storage, storage, &size32)
  }

  /// Cloning cosine function.
  public func cos() -> SWKStorage<T> {
    return cloneWith { newStorage in
      vvcos(newStorage.storage, storage, &size32)
    }
  }

  /// In-place cosine function.
  public func cos_() {
    vvcos(storage, storage, &size32)
  }
}
