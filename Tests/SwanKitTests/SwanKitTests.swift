import XCTest
@testable import SwanKit

class SwanKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwanKit().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
