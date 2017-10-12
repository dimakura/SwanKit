//
// SWKSizeTest.swift
//
// Created by Dimitri Kurashvili on 2017-10-13
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import XCTest
@testable import SwanKit

class SWKSizeTest: XCTestCase {
  var size: SWKSize!

  override func setUp() {
    size = SWKSize(1, 2, 3, 4)
  }

  func testSubscriptAccess() {
    XCTAssertEqual(size[0], 1)
    XCTAssertEqual(size[1], 2)
    XCTAssertEqual(size[2], 3)
    XCTAssertEqual(size[3], 4)
  }

  func testPropertyAccess() {
    XCTAssertEqual(size.x, 1)
    XCTAssertEqual(size.y, 2)
    XCTAssertEqual(size.z, 3)
    XCTAssertEqual(size.t, 4)
  }

  static var allTests = [
    ("testSubscriptAccess", testSubscriptAccess),
    ("testPropertyAccess", testPropertyAccess),
  ]
}
