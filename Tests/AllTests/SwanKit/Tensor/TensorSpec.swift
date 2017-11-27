import SSpec
import SwanKit

private func spec_creation() {
  describe("Create tensor 5x3") {
    var tensor: SWKIntTensor!

    before {
      tensor = SWKIntTensor(5, 3)
    }

    it("has size 5x3") {
      expect(tensor.size.dimensions).to.eq([5, 3])
    }

    it("has stride [3, 1]") {
      expect(tensor.stride.dimensions).to.eq([3, 1])
    }

    it("has storage of size 15") {
      expect(tensor.storage.size).to.eq(15)
    }

    it("is contiguous") {
      expect(tensor.isContiguous()).to.beTrue
    }

    it("is not transposed") {
      expect(tensor.isTransposed()).to.beFalse
    }
  }
}

private func spec_subscript() {
  describe("Subscript") {
    var tensor: SWKIntTensor!

    before {
      tensor = SWKIntTensor(2, 2)
      // 1 3
      // 2 4
      tensor[0, 0] = 1
      tensor[1, 0] = 2
      tensor[0, 1] = 3
      tensor[1, 1] = 4
    }

    it("has 1 at (0, 0)") {
      expect(tensor[0, 0]).to.eq(1)
    }

    it("has 2 at (1, 0)") {
      expect(tensor[1, 0]).to.eq(2)
    }

    it("has 3 at (0, 1)") {
      expect(tensor[0, 1]).to.eq(3)
    }

    it("has 4 at (1, 1)") {
      expect(tensor[1, 1]).to.eq(4)
    }

    it("has storage [1, 3, 2, 4]") {
      let storage = tensor.storage
      expect(storage[0]).to.eq(1)
      expect(storage[1]).to.eq(3)
      expect(storage[2]).to.eq(2)
      expect(storage[3]).to.eq(4)
    }
  }
}

private func spec_initFrom1DArray() {
  describe("init from 1D array") {
    let data: [SWKInt] = [1, 2, 3]
    var tensor: SWKIntTensor!

    before {
      tensor = SWKIntTensor(data: data)
    }

    it("has size \(data.count)") {
      expect(tensor.size.dimensions).to.eq([data.count])
    }

    it("contains all elements from array") {
      for (i, value) in data.enumerated() {
        expect(tensor[i]).to.eq(value)
      }
    }
  }
}

private func spec_initFrom2DArray() {
  describe("init from 2D array") {
    let data: [[SWKInt]] = [[1, 2, 3], [4, 5, 6]]
    var tensor: SWKIntTensor!

    before {
      tensor = SWKIntTensor(data: data)
    }

    it("has size 2x3") {
      expect(tensor.size.dimensions).to.eq([2, 3])
    }

    it("contains all elements from array") {
      for (i, arr1) in data.enumerated() {
        for (j, value) in arr1.enumerated() {
          expect(tensor[i, j]).to.eq(value)
        }
      }
    }
  }
}

private func spec_initFrom3DArray() {
  describe("init from 3D array") {
    let data: [[[SWKInt]]] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
    var tensor: SWKIntTensor!

    before {
      tensor = SWKIntTensor(data: data)
    }

    it("has size 2x2x2") {
      expect(tensor.size.dimensions).to.eq([2, 2, 2])
    }

    it("contains all elements from array") {
      for (i, arr2) in data.enumerated() {
        for (j, arr1) in arr2.enumerated() {
          for (k, value) in arr1.enumerated() {
            expect(tensor[i, j, k]).to.eq(value)
          }
        }
      }
    }
  }
}

private func spec_transpose() {
  describe("#transpose") {
    var tensor: SWKIntTensor!

    before {
      tensor = SWKIntTensor(data: [[1, 2, 3], [4, 5, 6]])
      tensor.transpose()
    }

    it("has size 3x2") {
      expect(tensor.size.dimensions).to.eq([3, 2])
    }

    it("column[0] is [1, 2, 3]") {
      expect(tensor[0, 0]).to.eq(1)
      expect(tensor[1, 0]).to.eq(2)
      expect(tensor[2, 0]).to.eq(3)
    }

    it("column[1] is [4, 5, 6]") {
      expect(tensor[0, 1]).to.eq(4)
      expect(tensor[1, 1]).to.eq(5)
      expect(tensor[2, 1]).to.eq(6)
    }

    it("is not contiguous") {
      expect(tensor.isContiguous()).to.beFalse
    }

    it("is transposed") {
      expect(tensor.isTransposed()).to.beTrue
    }
  }
}

func spec_SWKTensor() {
  describe("SWKTensor") {
    spec_creation()
    spec_subscript()
    spec_initFrom1DArray()
    spec_initFrom2DArray()
    spec_initFrom3DArray()
    spec_transpose()
  }
}
