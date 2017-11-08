import SSpec
import SwanKit

extension SSExpect where T == SWKDevice {
  public var beCPU: Void {
    assert(
      value?.isCPU ?? false,
      error: "Expected \(valueStr) to be CPU device",
      errorNegate: "Expected \(valueStr) to not be CPU device"
    )
  }

  public var beGPU: Void {
    assert(
      value?.isGPU ?? false,
      error: "Expected \(valueStr) to be GPU device",
      errorNegate: "Expected \(valueStr) to not be GPU device"
    )
  }
}
