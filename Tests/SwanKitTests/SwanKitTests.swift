import XCTest
import SSpec

class SwanKitTests: XCTestCase {
  func testAllSpecs() {
    SSpec.run {
      spec_SWKSize()
      spec_SWKStride()
      spec_SWKStorage()
      spec_FloatStorage()
      spec_SWKTensor()
      spec_SWKDevise()
    }

    XCTAssert(SSpec.hasErrors == false)
  }

  static var allTests = [
    ("testAllSpecs", testAllSpecs),
  ]
}
