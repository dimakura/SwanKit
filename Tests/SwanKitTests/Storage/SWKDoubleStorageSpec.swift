// NB: This file is autogenerated from `generate/math.swift`. Don't change it manually.

import SSpec
import SwanKit
import Foundation

func spec_SWKDoubleStorage() {
  describe("SWKDoubleStorage") {
    var storage: SWKDoubleStorage!

    context("cosine function") {
      before {
        storage = SWKDoubleStorage([0.0, 1.5708, 3.14159])
      }

      describe("#cos") {
        var newStorage: SWKDoubleStorage!

        before {
          newStorage = storage.cos()
        }

        it("computes a new storage") {
          expect(abs(newStorage[0] - cos(0.0)) < 0.0001).to.beTrue
          expect(abs(newStorage[1] - cos(1.5708)) < 0.0001).to.beTrue
          expect(abs(newStorage[2] - cos(3.14159)) < 0.0001).to.beTrue
        }

        it("keeps original storage unchanged") {
          expect(storage[0]).to.eq(0.0)
          expect(storage[1]).to.eq(1.5708)
          expect(storage[2]).to.eq(3.14159)
        }
      }

      describe("#cos_") {
        before {
          storage.cos_()
        }

        it("updates original storage") {
          expect(abs(storage[0] - cos(0.0)) < 0.0001).to.beTrue
          expect(abs(storage[1] - cos(1.5708)) < 0.0001).to.beTrue
          expect(abs(storage[2] - cos(3.14159)) < 0.0001).to.beTrue
        }
      }
    }

    context("sine function") {
      before {
        storage = SWKDoubleStorage([0.0, 1.5708, 3.14159])
      }

      describe("#sin") {
        var newStorage: SWKDoubleStorage!

        before {
          newStorage = storage.sin()
        }

        it("computes a new storage") {
          expect(abs(newStorage[0] - sin(0.0)) < 0.0001).to.beTrue
          expect(abs(newStorage[1] - sin(1.5708)) < 0.0001).to.beTrue
          expect(abs(newStorage[2] - sin(3.14159)) < 0.0001).to.beTrue
        }

        it("keeps original storage unchanged") {
          expect(storage[0]).to.eq(0.0)
          expect(storage[1]).to.eq(1.5708)
          expect(storage[2]).to.eq(3.14159)
        }
      }

      describe("#sin_") {
        before {
          storage.sin_()
        }

        it("updates original storage") {
          expect(abs(storage[0] - sin(0.0)) < 0.0001).to.beTrue
          expect(abs(storage[1] - sin(1.5708)) < 0.0001).to.beTrue
          expect(abs(storage[2] - sin(3.14159)) < 0.0001).to.beTrue
        }
      }
    }

    context("tangent function") {
      before {
        storage = SWKDoubleStorage([0.0, 1.5708, 3.14159])
      }

      describe("#tan") {
        var newStorage: SWKDoubleStorage!

        before {
          newStorage = storage.tan()
        }

        it("computes a new storage") {
          expect(abs(newStorage[0] - tan(0.0)) < 0.0001).to.beTrue
          expect(abs(newStorage[1] - tan(1.5708)) < 0.0001).to.beTrue
          expect(abs(newStorage[2] - tan(3.14159)) < 0.0001).to.beTrue
        }

        it("keeps original storage unchanged") {
          expect(storage[0]).to.eq(0.0)
          expect(storage[1]).to.eq(1.5708)
          expect(storage[2]).to.eq(3.14159)
        }
      }

      describe("#tan_") {
        before {
          storage.tan_()
        }

        it("updates original storage") {
          expect(abs(storage[0] - tan(0.0)) < 0.0001).to.beTrue
          expect(abs(storage[1] - tan(1.5708)) < 0.0001).to.beTrue
          expect(abs(storage[2] - tan(3.14159)) < 0.0001).to.beTrue
        }
      }
    }

    context("arccosine function") {
      before {
        storage = SWKDoubleStorage([1.0, 0.5, -0.25, -0.75])
      }

      describe("#acos") {
        var newStorage: SWKDoubleStorage!

        before {
          newStorage = storage.acos()
        }

        it("computes a new storage") {
          expect(abs(newStorage[0] - acos(1.0)) < 0.0001).to.beTrue
          expect(abs(newStorage[1] - acos(0.5)) < 0.0001).to.beTrue
          expect(abs(newStorage[2] - acos(-0.25)) < 0.0001).to.beTrue
          expect(abs(newStorage[3] - acos(-0.75)) < 0.0001).to.beTrue
        }

        it("keeps original storage unchanged") {
          expect(storage[0]).to.eq(1.0)
          expect(storage[1]).to.eq(0.5)
          expect(storage[2]).to.eq(-0.25)
          expect(storage[3]).to.eq(-0.75)
        }
      }

      describe("#acos_") {
        before {
          storage.acos_()
        }

        it("updates original storage") {
          expect(abs(storage[0] - acos(1.0)) < 0.0001).to.beTrue
          expect(abs(storage[1] - acos(0.5)) < 0.0001).to.beTrue
          expect(abs(storage[2] - acos(-0.25)) < 0.0001).to.beTrue
          expect(abs(storage[3] - acos(-0.75)) < 0.0001).to.beTrue
        }
      }
    }

    context("arcsine function") {
      before {
        storage = SWKDoubleStorage([1.0, 0.5, -0.25, -0.75])
      }

      describe("#asin") {
        var newStorage: SWKDoubleStorage!

        before {
          newStorage = storage.asin()
        }

        it("computes a new storage") {
          expect(abs(newStorage[0] - asin(1.0)) < 0.0001).to.beTrue
          expect(abs(newStorage[1] - asin(0.5)) < 0.0001).to.beTrue
          expect(abs(newStorage[2] - asin(-0.25)) < 0.0001).to.beTrue
          expect(abs(newStorage[3] - asin(-0.75)) < 0.0001).to.beTrue
        }

        it("keeps original storage unchanged") {
          expect(storage[0]).to.eq(1.0)
          expect(storage[1]).to.eq(0.5)
          expect(storage[2]).to.eq(-0.25)
          expect(storage[3]).to.eq(-0.75)
        }
      }

      describe("#asin_") {
        before {
          storage.asin_()
        }

        it("updates original storage") {
          expect(abs(storage[0] - asin(1.0)) < 0.0001).to.beTrue
          expect(abs(storage[1] - asin(0.5)) < 0.0001).to.beTrue
          expect(abs(storage[2] - asin(-0.25)) < 0.0001).to.beTrue
          expect(abs(storage[3] - asin(-0.75)) < 0.0001).to.beTrue
        }
      }
    }

    context("arctangent function") {
      before {
        storage = SWKDoubleStorage([1.0, 0.5, -0.25, -0.75])
      }

      describe("#atan") {
        var newStorage: SWKDoubleStorage!

        before {
          newStorage = storage.atan()
        }

        it("computes a new storage") {
          expect(abs(newStorage[0] - atan(1.0)) < 0.0001).to.beTrue
          expect(abs(newStorage[1] - atan(0.5)) < 0.0001).to.beTrue
          expect(abs(newStorage[2] - atan(-0.25)) < 0.0001).to.beTrue
          expect(abs(newStorage[3] - atan(-0.75)) < 0.0001).to.beTrue
        }

        it("keeps original storage unchanged") {
          expect(storage[0]).to.eq(1.0)
          expect(storage[1]).to.eq(0.5)
          expect(storage[2]).to.eq(-0.25)
          expect(storage[3]).to.eq(-0.75)
        }
      }

      describe("#atan_") {
        before {
          storage.atan_()
        }

        it("updates original storage") {
          expect(abs(storage[0] - atan(1.0)) < 0.0001).to.beTrue
          expect(abs(storage[1] - atan(0.5)) < 0.0001).to.beTrue
          expect(abs(storage[2] - atan(-0.25)) < 0.0001).to.beTrue
          expect(abs(storage[3] - atan(-0.75)) < 0.0001).to.beTrue
        }
      }
    }

    context("hyperbolic cosine function") {
      before {
        storage = SWKDoubleStorage([0.0, 3.14159, 6.28])
      }

      describe("#cosh") {
        var newStorage: SWKDoubleStorage!

        before {
          newStorage = storage.cosh()
        }

        it("computes a new storage") {
          expect(abs(newStorage[0] - cosh(0.0)) < 0.0001).to.beTrue
          expect(abs(newStorage[1] - cosh(3.14159)) < 0.0001).to.beTrue
          expect(abs(newStorage[2] - cosh(6.28)) < 0.0001).to.beTrue
        }

        it("keeps original storage unchanged") {
          expect(storage[0]).to.eq(0.0)
          expect(storage[1]).to.eq(3.14159)
          expect(storage[2]).to.eq(6.28)
        }
      }

      describe("#cosh_") {
        before {
          storage.cosh_()
        }

        it("updates original storage") {
          expect(abs(storage[0] - cosh(0.0)) < 0.0001).to.beTrue
          expect(abs(storage[1] - cosh(3.14159)) < 0.0001).to.beTrue
          expect(abs(storage[2] - cosh(6.28)) < 0.0001).to.beTrue
        }
      }
    }

    context("hyperbolic sine function") {
      before {
        storage = SWKDoubleStorage([0.0, 3.14159, 6.28])
      }

      describe("#sinh") {
        var newStorage: SWKDoubleStorage!

        before {
          newStorage = storage.sinh()
        }

        it("computes a new storage") {
          expect(abs(newStorage[0] - sinh(0.0)) < 0.0001).to.beTrue
          expect(abs(newStorage[1] - sinh(3.14159)) < 0.0001).to.beTrue
          expect(abs(newStorage[2] - sinh(6.28)) < 0.0001).to.beTrue
        }

        it("keeps original storage unchanged") {
          expect(storage[0]).to.eq(0.0)
          expect(storage[1]).to.eq(3.14159)
          expect(storage[2]).to.eq(6.28)
        }
      }

      describe("#sinh_") {
        before {
          storage.sinh_()
        }

        it("updates original storage") {
          expect(abs(storage[0] - sinh(0.0)) < 0.0001).to.beTrue
          expect(abs(storage[1] - sinh(3.14159)) < 0.0001).to.beTrue
          expect(abs(storage[2] - sinh(6.28)) < 0.0001).to.beTrue
        }
      }
    }

    context("hyperbolic tangent function") {
      before {
        storage = SWKDoubleStorage([0.0, 3.14159, 6.28])
      }

      describe("#tanh") {
        var newStorage: SWKDoubleStorage!

        before {
          newStorage = storage.tanh()
        }

        it("computes a new storage") {
          expect(abs(newStorage[0] - tanh(0.0)) < 0.0001).to.beTrue
          expect(abs(newStorage[1] - tanh(3.14159)) < 0.0001).to.beTrue
          expect(abs(newStorage[2] - tanh(6.28)) < 0.0001).to.beTrue
        }

        it("keeps original storage unchanged") {
          expect(storage[0]).to.eq(0.0)
          expect(storage[1]).to.eq(3.14159)
          expect(storage[2]).to.eq(6.28)
        }
      }

      describe("#tanh_") {
        before {
          storage.tanh_()
        }

        it("updates original storage") {
          expect(abs(storage[0] - tanh(0.0)) < 0.0001).to.beTrue
          expect(abs(storage[1] - tanh(3.14159)) < 0.0001).to.beTrue
          expect(abs(storage[2] - tanh(6.28)) < 0.0001).to.beTrue
        }
      }
    }
  }
}
