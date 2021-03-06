/// `SWKDevice` describes computation device.
public enum SWKDevice {
  /// CPU device.
  case CPU

  /// [Metal](https://developer.apple.com/metal/) enabled GPU device.
  case Metal

  /// [CUDA](https://developer.nvidia.com/cuda-toolkit) enabled GPU device.
  case CUDA

  /// Is this a CPU device?
  public var isCPU: Bool {
    return self == SWKDevice.CPU
  }

  /// Is this a GPU device?
  public var isGPU: Bool {
    return !isCPU
  }
}
