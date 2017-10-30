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
    SSpec.run {
      spec_SWKSize()
      spec_SWKDevise()
      spec_Dimensionality()
      spec_SWKStorage()
      spec_SWKTensor()
    }

    XCTAssert(SSpec.hasErrors == false)
  }

  static var allTests = [
    ("testAllSpecs", testAllSpecs),
  ]
}
