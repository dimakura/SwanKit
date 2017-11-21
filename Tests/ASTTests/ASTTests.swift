import XCTest
import SSpec

class ASTTests: XCTestCase {
  func testAllSpecs() {
    SSpec.run {
      classExtensionSpec()
      commentSpec()
      emptyLineSpec()
      functionSpec()
      functionDeclarationSpec()
      importStatementSpec()
      parameterSpec()
      simpleTypeSpec()
      sourceFileSpec()
      typeConstraintSpec()
    }

    XCTAssert(SSpec.hasErrors == false)
  }

  static var allTests = [
    ("testAllSpecs", testAllSpecs),
  ]
}
