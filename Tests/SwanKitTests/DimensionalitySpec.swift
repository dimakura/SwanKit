import SSpec
@testable import SwanKit

private func spec_cutDimensions() {
  func testDimensionalityReduction(from: [Int], to: [Int]) {
    it("reduces \(from) to \(to)") {
      expect(cutDimensions(from)).to.eq(to)
    }
  }

  describe("cutDimensions") {
    testDimensionalityReduction(from: [0, 2, 3], to: [])
    testDimensionalityReduction(from: [1, 0, 3], to: [1])
    testDimensionalityReduction(from: [1, 2, 0], to: [1, 2])
    testDimensionalityReduction(from: [1, 2, 3], to: [1, 2, 3])
  }
}

private func spec_calculateStride() {
  func testStrideCalculation(dimensions: [Int], stride: [Int]) {
    it("stride for \(dimensions) is \(stride)") {
      expect(calculateStride(dimensions)).to.eq(stride)
    }
  }

  describe("calculateStride") {
    testStrideCalculation(dimensions: [Int](),       stride: [Int]())
    testStrideCalculation(dimensions: [1],           stride: [1])
    testStrideCalculation(dimensions: [5],           stride: [1])
    testStrideCalculation(dimensions: [5, 3],        stride: [3, 1])
    testStrideCalculation(dimensions: [10, 5, 3],    stride: [15, 3, 1])
    testStrideCalculation(dimensions: [2, 10, 5, 3], stride: [150, 15, 3, 1])
  }
}

private func spec_calculateSize() {
  func test1DArray(array: [Int], size: SWKSize) {
    context(array.description) {
      it("has size \(size)") {
        expect(calculateSize(array).dimensions).to.eq(size.dimensions)
      }
    }
  }

  func test2DArray(array: [[Int]], size: SWKSize) {
    context(array.description) {
      it("has size \(size)") {
        expect(calculateSize(array).dimensions).to.eq(size.dimensions)
      }
    }
  }

  func test3DArray(array: [[[Int]]], size: SWKSize) {
    context(array.description) {
      it("has size \(size)") {
        expect(calculateSize(array).dimensions).to.eq(size.dimensions)
      }
    }
  }

  test1DArray(array: [Int](),                  size: SWKSize())
  test1DArray(array: [1, 2, 3],                size: SWKSize(3))

  test2DArray(array: [[Int]](),                size: SWKSize())
  test2DArray(array: [[], [4, 5, 6]],          size: SWKSize())
  test2DArray(array: [[1, 2, 3], [4, 5, 6]],   size: SWKSize(2, 3))

  test3DArray(array: [[[Int]]](),              size: SWKSize())
  test3DArray(array: [[[], [1, 2]]],           size: SWKSize())
  test3DArray(array: [[[1, 2, 3], [4, 5, 6]]], size: SWKSize(1, 2, 3))
}

func spec_Dimensionality() {
  describe("Dimensionality") {
    spec_cutDimensions()
    spec_calculateStride()
    spec_calculateSize()
  }
}
