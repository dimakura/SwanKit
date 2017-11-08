import SSpec
import SwanKit
import Foundation

func spec_FloatStorage() {
  describe("SWKFloatStorage") {
    var storage: SWKFloatStorage!

    before {
      storage = SWKFloatStorage([1, 2, 3])
    }

    describe("#sin_") {
      before {
        storage.sin_()
      }

      it("computes sine") {
        expect(storage[0]).to.eq(sin(1))
        expect(storage[1]).to.eq(sin(2))
        expect(storage[2]).to.eq(sin(3))
      }
    }
  }
}
