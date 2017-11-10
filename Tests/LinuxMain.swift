import XCTest

@testable import ASTTests
@testable import SwanKitTests

XCTMain([
  testCase(ASTTests.allTests),
  testCase(SwanKitTests.allTests),
])
