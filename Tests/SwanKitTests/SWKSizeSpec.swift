//
// SwanKit
// SWKSizeSpec.swift
//
// Created by Dimitri Kurashvili on 2017-10-13
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import SSpec
import SwanKit

func spec_SWKSize() {
  describe("SWKSize") {
    context("size properties") {
      func testSizeProperties(_ sizeArray: [Int], dimensions: [Int], capacity: Int, empty: Bool) {
        let size = SWKSize(sizeArray)

        context(size.isEmpty ? sizeArray.description : size.description) {
          it("number of dimensions is \(dimensions.count)") {
            expect(size.numberOfDimensions).to.eq(dimensions.count)
          }

          it("has capacity of \(capacity)") {
            expect(size.capacity).to.eq(capacity)
          }

          it("is \(empty ? "" : "not ")empty") {
            expect(size.isEmpty).to.eq(empty)
          }

          it("dimensions are \(dimensions)") {
            expect(size.dimensions).to.eq(dimensions)
          }
        }
      }

      testSizeProperties([5, 3],     dimensions: [5, 3],     capacity: 15,  empty: false)
      testSizeProperties([5, 3, 10], dimensions: [5, 3, 10], capacity: 150, empty: false)
      testSizeProperties([5, 0],     dimensions: [5],        capacity: 5,   empty: false)
      testSizeProperties([0, 5],     dimensions: [],         capacity: 0,   empty: true)
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
