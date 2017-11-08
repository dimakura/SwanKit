import SSpec
import SwanKit

func spec_SWKDevise() {
  describe("SWKDevice") {
    context("default device") {
      it("is .CPU") {
        expect(SWKConfig.currentDevice).to.eq(SWKDevice.CPU)
      }
    }

    describe(".CPU") {
      let device = SWKDevice.CPU

      it("is CPU") {
        expect(device).to.beCPU
      }

      it("is not GPU") {
        expect(device).to.not.beGPU
      }
    }

    for device in [SWKDevice.Metal, SWKDevice.CUDA] {
      describe("\(device)") {
        it("is not CPU") {
          expect(device).to.not.beCPU
        }

        it("is GPU") {
          expect(device).to.beGPU
        }
      }
    }
  }
}
