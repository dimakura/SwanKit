import SSpec
import SwanKit

private func spec_initialization() {
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

private func spec_storageIndex() {
  describe("#storageIndex") {
    var stride: SWKStride!
    var offset: Int!

    before {
      let size = SWKSize(5, 3)
      stride = SWKStride(size :size)
    }

    func testStorageIndex(tensorIndex: [Int], storageIndex: Int) {
      it("storage index for \(tensorIndex) is \(storageIndex)") {
        let calculatedIndex = stride.storageIndex(offset: offset, indices: tensorIndex)
        expect(calculatedIndex).to.eq(storageIndex)
      }
    }

    context("offset is zero") {
      before {
        offset = 0
      }

      for i in 0..<5 {
        testStorageIndex(tensorIndex: [i, 0], storageIndex: 3 * i)
        testStorageIndex(tensorIndex: [i, 1], storageIndex: 3 * i + 1)
        testStorageIndex(tensorIndex: [i, 2], storageIndex: 3 * i + 2)
      }
    }

    context("offset is one") {
      before {
        offset = 1
      }

      for i in 0..<5 {
        testStorageIndex(tensorIndex: [i, 0], storageIndex: offset + 3 * i)
        testStorageIndex(tensorIndex: [i, 1], storageIndex: offset + 3 * i + 1)
        testStorageIndex(tensorIndex: [i, 2], storageIndex: offset + 3 * i + 2)
      }
    }
  }
}

func spec_SWKStride() {
  describe("SWKStride") {
    spec_initialization()
    spec_storageIndex()
  }
}
