//
// SwanKit
// SWKDeviceTest.swift
//
// Created by Dimitri Kurashvili on 2017-10-14
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import XCTest
@testable import SwanKit

class SWKDeviceTest: XCTestCase {

  func testDefaultDevice() {
    XCTAssertEqual(SWKConfig.currentDevice, SWKDevice.CPU)
  }

  func testIsCPU() {
    XCTAssertTrue(SWKDevice.CPU.isCPU)
    XCTAssertFalse(SWKDevice.Metal.isCPU)
    XCTAssertFalse(SWKDevice.CUDA.isCPU)
  }

  func testIsGPU() {
    XCTAssertFalse(SWKDevice.CPU.isGPU)
    XCTAssertTrue(SWKDevice.Metal.isGPU)
    XCTAssertTrue(SWKDevice.CUDA.isGPU)
  }

  static var allTests = [
    ("testDefaultDevice", testDefaultDevice),
    ("testIsCPU", testIsCPU),
    ("testIsGPU", testIsGPU),
  ]

}
