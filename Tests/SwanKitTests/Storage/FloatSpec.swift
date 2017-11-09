import SSpec
import SwanKit
import Foundation

func spec_FloatStorage() {
  describe("SWKFloatStorage") {
    var storage: SWKFloatStorage!

    before {
      storage = SWKFloatStorage([1, 2, 3])
    }

    describe("#sin") {
      var newStorage: SWKFloatStorage!

      before {
        newStorage = storage.sin()
      }

      it("computes sine for the same storage") {
        expect(newStorage[0]).to.eq(sin(1))
        expect(newStorage[1]).to.eq(sin(2))
        expect(newStorage[2]).to.eq(sin(3))
      }

      it("keeps original storage unchanged") {
        expect(storage[0]).to.eq(1)
        expect(storage[1]).to.eq(2)
        expect(storage[2]).to.eq(3)
      }
    }

    describe("#sin_") {
      before {
        storage.sin_()
      }

      it("computes sine for the same storage") {
        expect(storage[0]).to.eq(sin(1))
        expect(storage[1]).to.eq(sin(2))
        expect(storage[2]).to.eq(sin(3))
      }
    }
  }
}
