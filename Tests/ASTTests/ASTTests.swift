import XCTest
import SSpec

class ASTTests: XCTestCase {
  func testAllSpecs() {
    SSpec.run {
      commentSpec()
      importStatementSpec()
      sourceFileSpec()
    }

    XCTAssert(SSpec.hasErrors == false)
  }

  static var allTests = [
    ("testAllSpecs", testAllSpecs),
  ]
}
