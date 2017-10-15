//
// SwanKit
// DimensionalityTest.swift
//
// Created by Dimitri Kurashvili on 2017-10-14
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import XCTest
@testable import SwanKit

class DimensionalityTest: XCTestCase {

  func test_cutDimensions() {
    XCTAssertEqual(SWK_cutDimensions([0, 2, 3]), [])
    XCTAssertEqual(SWK_cutDimensions([1, 0, 3]), [1])
    XCTAssertEqual(SWK_cutDimensions([1, 2, 0]), [1, 2])
    XCTAssertEqual(SWK_cutDimensions([1, 2, 3]), [1, 2, 3])
  }

  static var allTests = [
    ("test_cutDimensions", test_cutDimensions),
  ]

}
