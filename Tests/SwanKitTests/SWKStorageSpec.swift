//
// SwanKit
// SWKStorageSpec.swift
//
// Created by Dimitri Kurashvili on 2017-10-14
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import SSpec
import SwanKit

private func spec_SWKStorage_elementSize() {
  describe("elementSize") {
    it("is 1 for byte storage") {
      expect(SWKByteStorage(100).elementSize).to.eq(1)
    }

    it("is 2 for short storage") {
      expect(SWKShortStorage(100).elementSize).to.eq(2)
    }

    it("is 4 for int storage") {
      expect(SWKIntStorage(100).elementSize).to.eq(4)
    }

    it("is 8 for long storage") {
      expect(SWKLongStorage(100).elementSize).to.eq(8)
    }

    it("is 4 for float storage") {
      expect(SWKFloatStorage(100).elementSize).to.eq(4)
    }

    it("is 8 for double storage") {
      expect(SWKDoubleStorage(100).elementSize).to.eq(8)
    }
  }
}

private func spec_SWKStorage_size() {
  describe("size") {
    context("when initialized with size = 100") {
      let storage = SWKIntStorage(100)

      it("is 100") {
        expect(storage.size).to.eq(100)
      }
    }

    context("when initialized with array of size = 4") {
      let storage = SWKShortStorage([1, 2, 3, 4])

      it("is 4") {
        expect(storage.size).to.eq(4)
        expect(storage[0]).to.eq(1)
        expect(storage[1]).to.eq(2)
        expect(storage[2]).to.eq(3)
        expect(storage[3]).to.eq(4)
      }
    }
  }
}

private func spec_SWKStorage_device() {
  describe("device") {
    it("is default device") {
      expect(SWKIntStorage(10).device).to.eq(SWKConfig.currentDevice)
    }

    func testSettingDevice(device: SWKDevice) {
      context("when device is set to \(device)") {
        let storage = SWKIntStorage(10)
        storage.device = device

        it("is \(device)") {
          expect(storage.device).to.eq(device)
        }

        it("is \(device.isCPU ? "" : "not ")CPU") {
          expect(storage.isCPU).to.eq(device.isCPU)
        }

        it("is \(device.isGPU ? "" : "not ")GPU") {
          expect(storage.isGPU).to.eq(device.isGPU)
        }
      }
    }

    testSettingDevice(device: .CPU)
    testSettingDevice(device: .Metal)
    testSettingDevice(device: .CUDA)
  }
}

private func spec_SWKStorage_subscript() {
  describe("storage [1, 2, 3, 4, 5]") {
    var storage: SWKIntStorage!

    before {
      storage = SWKIntStorage([1, 2, 3, 4, 5])
    }

    it("has size 5") {
      expect(storage.size).to.eq(5)
    }

    it("has initial values") {
      for i in 0..<storage.size {
        let expectedValue = Int32(truncatingIfNeeded: i + 1)
        expect(storage[i]).to.eq(expectedValue)
      }
    }

    it("can update values") {
      storage[0] = 42
      expect(storage[0]).to.eq(42)
    }
  }
}

private func spec_SWKStorage_conversions() {
  describe("cpu") {
    it("can convert storage to CPU")
  }

  describe("gpu") {
    it("can convert storage to GPU")
  }
}

private func spec_SWKStorage_fill_operations() {
  context("when filling with zeros") {
    var storage: SWKFloatStorage!

    before {
      storage = SWKFloatStorage(5)
      storage.zeros()
    }

    it("contains all zeros") {
      for i in 0..<5 {
        expect(storage[i]).to.eq(0)
      }
    }
  }

  describe("when filling with ones") {
    var storage: SWKFloatStorage!

    before {
      storage = SWKFloatStorage(5)
      storage.ones()
    }



    it("contains all ones") {
      for i in 0..<5 {
        expect(storage[i]).to.eq(1)
      }
    }
  }
}

func spec_SWKStorage() {
  describe("SWKStorage") {
    spec_SWKStorage_elementSize()
    spec_SWKStorage_size()
    spec_SWKStorage_device()
    spec_SWKStorage_subscript()
    spec_SWKStorage_conversions()
    spec_SWKStorage_fill_operations()
  }
}
