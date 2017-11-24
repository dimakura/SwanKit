import XCTest
import SSpec

class AllTests: XCTestCase {
  func spec_AST() {
    spec_DocComment()
  }

  func spec_SWK() {
    spec_SWKDevise()
    spec_SWKDoubleStorage()
    spec_SWKFloatStorage()
    spec_SWKSize()
    spec_SWKStorage()
    spec_SWKStride()
    spec_SWKTensor()
  }

  func testAllSpecs() {
    SSpec.run {
      spec_AST()
      spec_SWK()
    }

    XCTAssert(SSpec.hasErrors == false)
  }

  static var allTests = [
    ("testAllSpecs", testAllSpecs),
  ]
}
