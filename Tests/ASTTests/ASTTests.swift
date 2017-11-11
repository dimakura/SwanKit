import XCTest
import SSpec

class ASTTests: XCTestCase {
  func testAllSpecs() {
    SSpec.run {
      commentSpec()
      emptyLineSpec()
      importStatementSpec()
      sourceFileSpec()
    }

    XCTAssert(SSpec.hasErrors == false)
  }

  static var allTests = [
    ("testAllSpecs", testAllSpecs),
  ]
}
