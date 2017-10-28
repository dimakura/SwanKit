//
// SwanKit
// SWKStorageTest.swift
//
// Created by Dimitri Kurashvili on 2017-10-14
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import SSpec
import SwanKit

private func test_SWKStorage_elementSize() {
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

private func test_SWKStorage_size() {
  describe("size") {
    context("when initialized with size = 100") {
      let storage = SWKStorage(100)

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

private func test_SWKStorage_device() {
  describe("device") {
    it("is default device") {
      expect(SWKStorage(10).device).to.eq(SWKConfig.currentDevice)
    }

    func testSettingDevice(device: SWKDevice) {
      context("when device is set to \(device)") {
        let storage = SWKStorage(10)
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

private func test_SWKStorage_subscript() {
  describe("storage [1, 2, 3, 4, 5]") {
    // TODO: before needed here (SSpec issue #3)
    let storage = SWKIntStorage([1, 2, 3, 4, 5])

    it("has size 5") {
      expect(storage.size).to.eq(5)
    }

    for i in 0..<storage.size {
      it("storage[\(i)] == \(i + 1)") {
        let expectedValue = Int32(truncatingIfNeeded: i + 1)
        expect(storage[i]).to.eq(expectedValue)
      }
    }

    it("can update values") {
      storage[0] = 10
      storage[1] = 9
      storage[2] = 8
      storage[3] = 7
      storage[4] = 6
      expect(storage[0]).to.eq(10)
      expect(storage[1]).to.eq(9)
      expect(storage[2]).to.eq(8)
      expect(storage[3]).to.eq(7)
      expect(storage[4]).to.eq(6)
    }
  }
}

private func test_SWKStorage_conversions() {
  describe("cpu") {
    it("can convert storage to CPU")
  }

  describe("gpu") {
    it("can convert storage to GPU")
  }
}

func test_SWKStorage() {
  describe("SWKStorage") {
    test_SWKStorage_elementSize()
    test_SWKStorage_size()
    test_SWKStorage_device()
    test_SWKStorage_subscript()
    test_SWKStorage_conversions()
  }
}
