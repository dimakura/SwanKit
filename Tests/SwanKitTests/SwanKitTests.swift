//
// SwanKit
// SwanKitTests.swift
//
// Created by Dimitri Kurashvili on 2017-10-25
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import XCTest
import SSpec

class SwanKitTests: XCTestCase {
  func testAllSpecs() {
    let session = SSS.run {
      test_SWKSize()
      test_SWKDevise()
      test_Dimensionality()
      test_SWKStorage()
    }

    XCTAssert(session.hasErrors == false)
  }

  static var allTests = [
    ("testAllSpecs", testAllSpecs),
  ]
}
