import XCTest
import SSpec

class ASTTests: XCTestCase {
  func testAllSpecs() {
    SSpec.run {
      importStatementSpec()
      commentSpec()
    }

    XCTAssert(SSpec.hasErrors == false)
  }

  static var allTests = [
    ("testAllSpecs", testAllSpecs),
  ]
}
