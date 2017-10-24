//
// SwanKit
// SWKDeviceTest.swift
//
// Created by Dimitri Kurashvili on 2017-10-14
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import SSpec
import SwanKit

func test_SWKDevise() {
  describe("SWKDevice") {
    context("default device") {
      it("is CPU") {
        expect(SWKConfig.currentDevice).to.eq(SWKDevice.CPU)
      }
    }

    func testIsCPU(_ device: SWKDevice, isCPU: Bool, isGPU: Bool) {
      context("when \(device)") {
        it("is \(isCPU ? "" : "not ")CPU") {
          expect(device.isCPU).to.eq(isCPU)
        }

        it("is \(isGPU ? "" : "not ")GPU") {
          expect(device.isGPU).to.eq(isGPU)
        }
      }
    }

    testIsCPU(SWKDevice.CPU, isCPU: true, isGPU: false)
    testIsCPU(SWKDevice.Metal, isCPU: false, isGPU: true)
    testIsCPU(SWKDevice.CUDA, isCPU: false, isGPU: true)
  }
}
