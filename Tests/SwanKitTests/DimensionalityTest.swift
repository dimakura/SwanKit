//
// SwanKit
// DimensionalityTest.swift
//
// Created by Dimitri Kurashvili on 2017-10-14
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import SSpec
@testable import SwanKit

func test_Dimensionality() {
  describe("Dimensionality") {
    func testDimensionalityReduction(from: [Int], to: [Int]) {
      it("reduces \(from) to \(to)") {
        let cutted = SWK_cutDimensions(from)
        expect(cutted.count).to.eq(to.count)
        for (idx, value) in cutted.enumerated() {
          expect(to[idx]).to.eq(cutted[idx])
        }
      }
    }

    testDimensionalityReduction(from: [0, 2, 3], to: [])
    testDimensionalityReduction(from: [1, 0, 3], to: [1])
    testDimensionalityReduction(from: [1, 2, 0], to: [1, 2])
    testDimensionalityReduction(from: [1, 2, 3], to: [1, 2, 3])
  }
}
