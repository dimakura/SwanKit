import SSpec
import SwanKit

func spec_SWKStride() {
  describe("SWKStride") {
    func testStrideInitialization(size sizeDimensions: [Int], stride strideDimensions: [Int]) {
      let size = SWKSize(sizeDimensions)
      let stride = SWKStride(size: size)

      it("stride for \(sizeDimensions) is \(strideDimensions)") {
        expect(stride.dimensions).to.eq(strideDimensions)
      }
    }

    describe("initialization") {
      testStrideInitialization(size: [Int](),       stride: [Int]())
      testStrideInitialization(size: [1],           stride: [1])
      testStrideInitialization(size: [5],           stride: [1])
      testStrideInitialization(size: [5, 3],        stride: [3, 1])
      testStrideInitialization(size: [10, 5, 3],    stride: [15, 3, 1])
      testStrideInitialization(size: [2, 10, 5, 3], stride: [150, 15, 3, 1])
    }
  }
}
