import SSpec
import SwanKit

func spec_SWKSize() {
  describe("SWKSize") {
    describe("creation") {
      func testDimensionalityReduction(from: [Int], to: [Int]) {
        it("reduces \(from) to \(to)") {
          expect(SWKSize(from).dimensions).to.eq(to)
        }
      }

      testDimensionalityReduction(from: [0, 2, 3], to: [])
      testDimensionalityReduction(from: [1, 0, 3], to: [1])
      testDimensionalityReduction(from: [1, 2, 0], to: [1, 2])
      testDimensionalityReduction(from: [1, 2, 3], to: [1, 2, 3])
    }

    describe("size properties") {
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

    describe("description") {
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

    describe("transpose") {
      func testTranspose(dimensions: [Int], dim1: Int, dim2: Int, expectedDimensions: [Int]) {
        let size = SWKSize(dimensions)
        size.transpose(dim1: dim1, dim2: dim2)

        it("\(dimensions) along \(dim1) and \(dim2) is \(expectedDimensions)") {
          expect(size.dimensions).to.eq(expectedDimensions)
        }
      }

      testTranspose(dimensions: [5, 3],    dim1: 0, dim2: 1, expectedDimensions: [3, 5])
      testTranspose(dimensions: [5, 3],    dim1: 1, dim2: 0, expectedDimensions: [3, 5])
      testTranspose(dimensions: [5, 2, 3], dim1: 0, dim2: 2, expectedDimensions: [3, 2, 5])
      testTranspose(dimensions: [5, 2, 3], dim1: 0, dim2: 9, expectedDimensions: [5, 2, 3])
    }
  }
}
