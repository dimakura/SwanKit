//
// SwanKit
// SWKSizeTest.swift
//
// Created by Dimitri Kurashvili on 2017-10-13
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import SSpec
import SwanKit

func test_SWKSize() {
  describe("SWKSize") {
    context("subscript access") {
      let size = SWKSize(10, 20, 15, 90)

      it("can accesses dimensions") {
        expect(size[0]).to.eq(10)
        expect(size[1]).to.eq(20)
        expect(size[2]).to.eq(15)
        expect(size[3]).to.eq(90)
      }
    }

    context("size properties") {
      func testSizeProperties(_ sizeArray: [Int], dimensions: Int, capacity: Int, empty: Bool) {
        let size = SWKSize(sizeArray)
        context(size.isEmpty ? sizeArray.description : size.description) {
          it("has \(dimensions) dimensions") {
            expect(size.dimensions).to.eq(dimensions)
          }
          it("has capacity of \(capacity)") {
            expect(size.capacity).to.eq(capacity)
          }
          it("is \(empty ? "" : "NOT ")empty") {
            expect(size.isEmpty).to.eq(empty)
          }
        }
      }

      testSizeProperties([5, 3], dimensions: 2, capacity: 15, empty: false)
      testSizeProperties([5, 3, 10], dimensions: 3, capacity: 150, empty: false)
      testSizeProperties([5, 0], dimensions: 1, capacity: 5, empty: false)
      testSizeProperties([0, 5], dimensions: 0, capacity: 0, empty: true)
    }

    context("description") {
      func testSizeDescription(_ size: SWKSize, description: String) {
        context("SWKSize[\(size.description)]") {
          it("has description `\(description)`") {
            expect(size.description).to.eq(description)
          }
        }
      }

      testSizeDescription(SWKSize(5, 3), description: "5x3")
      testSizeDescription(SWKSize(), description: "")
    }
  }
}
