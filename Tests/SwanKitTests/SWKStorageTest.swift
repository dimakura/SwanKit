//
// SwanKit
// SWKStorageTest.swift
//
// Created by Dimitri Kurashvili on 2017-10-14
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import XCTest
@testable import SwanKit

class SWKStorageTest: XCTestCase {

  func testInitializationWithSize() {
    let storage = SWKStorage(1_000)
    XCTAssertEqual(storage.elementSize, 4)
    XCTAssertEqual(storage.size, 1_000)
  }

  func testInitializationWithArray() {
    let storage = SWKStorage([1, 2, 3, 4, 5])
    XCTAssertEqual(storage.elementSize, 4)
    XCTAssertEqual(storage.size, 5)
    for i in 0..<storage.size {
      XCTAssertEqual(storage[i], Float(i + 1))
    }
  }

  func testElementSizes() {
    XCTAssertEqual(SWKByteStorage(1).elementSize,   1)
    XCTAssertEqual(SWKShortStorage(1).elementSize,  2)
    XCTAssertEqual(SWKIntStorage(1).elementSize,    4)
    XCTAssertEqual(SWKLongStorage(1).elementSize,   8)

    XCTAssertEqual(SWKFloatStorage(1).elementSize,  4)
    XCTAssertEqual(SWKDoubleStorage(1).elementSize, 8)
  }

  static var allTests = [
    ("testInitializationWithSize", testInitializationWithSize),
    ("testInitializationWithArray", testInitializationWithArray),
    ("testElementSizes", testElementSizes)
  ]

}
