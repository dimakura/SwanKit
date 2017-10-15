//
// SwanKit
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

  func testDimensionality() {
    XCTAssertEqual(SWKSize(1).dimensions, 1)
    XCTAssertEqual(SWKSize(1, 2).dimensions, 2)
    XCTAssertEqual(SWKSize(1, 2, 3).dimensions, 3)
    XCTAssertEqual(SWKSize(1, 2, 3, 0, 5).dimensions, 3)
    XCTAssertEqual(size.dimensions, 4)
  }

  func testCapacity() {
    XCTAssertEqual(size.capacity, 24)
    XCTAssertEqual(SWKSize(1_000, 400, 5).capacity, 2_000_000)
    XCTAssertEqual(SWKSize(1, 2, 3, 0, 10).capacity, 6)
  }

  func testEmptiness() {
    XCTAssertFalse(size.isEmpty)
    XCTAssertTrue(SWKSize().isEmpty)
    XCTAssertTrue(SWKSize().isEmpty)
  }

  func testDescription() {
    XCTAssertEqual(size.description, "1x2x3x4")
    XCTAssertEqual(SWKSize().description, "")
  }

  static var allTests = [
    ("testSubscriptAccess", testSubscriptAccess),
    ("testDimensionality", testDimensionality),
    ("testCapacity", testCapacity),
    ("testEmptiness", testEmptiness),
    ("testDescription", testDescription),
  ]

}
