//
// SwanKit
// SWKDevice.swift
//
// Created by Dimitri Kurashvili on 2017-10-14
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

/// `SWKDevice` describes device available for computation.
public enum SWKDevice {

  /// CPU device.
  case CPU

  /// [Metal](https://developer.apple.com/metal/) enabled GPU device.
  case Metal

  /// [CUDA](https://developer.nvidia.com/cuda-toolkit) enabled GPU device.
  case CUDA

  private static var _defaultDevice = SWKDevice.CPU

  /// Currently configured default device.
  public static var defaultDevice: SWKDevice {
    get {
      return _defaultDevice
    }

    set {
      _defaultDevice = newValue
    }
  }

  /// Is this a CPU device?
  public var isCPU: Bool {
    return self == SWKDevice.CPU
  }

  /// Is this a GPU device?
  public var isGPU: Bool {
    return !isCPU
  }

}
