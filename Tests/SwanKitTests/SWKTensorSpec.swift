//
// SwanKit
// SWKTensorSpec.swift
//
// Created by Dimitri Kurashvili on 2017-10-14
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

import SSpec
import SwanKit

private func spec_creation() {
  let tensor = SWKIntTensor(5, 3)

  describe("Create \(tensor.description)") {
    it("has size 5x3") {
      expect(tensor.size.dimensions).to.eq([5, 3])
    }

    it("has stride [3, 1]") {
      expect(tensor.stride).to.eq([3, 1])
    }

    it("has storage of size 15") {
      expect(tensor.storage.size).to.eq(15)
    }
  }
}

private func spec_subscript() {
  describe("Subscript") {
    // 1 3
    // 2 4
    let tensor = SWKIntTensor(2, 2)
    tensor[0, 0] = 1
    tensor[1, 0] = 2
    tensor[0, 1] = 3
    tensor[1, 1] = 4

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
  let tensor = SWKIntTensor([1, 2, 3])

  describe("init from 1D array") {
    it("has size 3") {
      expect(tensor.size.dimensions).to.eq([3])
    }

    it("contains all elements from array") {
      expect(tensor[0]).to.eq(1)
      expect(tensor[1]).to.eq(2)
      expect(tensor[2]).to.eq(3)
    }
  }
}

private func spec_initFrom2DArray() {
  let tensor = SWKIntTensor([[1, 2, 3], [4, 5, 6]])

  describe("init from 2D array") {
    it("has size 2x3") {
      expect(tensor.size.dimensions).to.eq([2, 3])
    }

    it("contains all elements from array") {
      expect(tensor[0, 0]).to.eq(1)
      expect(tensor[0, 1]).to.eq(2)
      expect(tensor[0, 2]).to.eq(3)
      expect(tensor[1, 0]).to.eq(4)
      expect(tensor[1, 1]).to.eq(5)
      expect(tensor[1, 2]).to.eq(6)
    }
  }
}

public func spec_initFrom3DArray() {
  let tensor = SWKIntTensor([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])

  describe("init from 3D array") {
    it("has size 2x2x2") {
      expect(tensor.size.dimensions).to.eq([2, 2, 2])
    }

    it("contains all elements from array") {
      expect(tensor[0, 0, 0]).to.eq(1)
      expect(tensor[0, 0, 1]).to.eq(2)
      expect(tensor[0, 1, 0]).to.eq(3)
      expect(tensor[0, 1, 1]).to.eq(4)
      expect(tensor[1, 0, 0]).to.eq(5)
      expect(tensor[1, 0, 1]).to.eq(6)
      expect(tensor[1, 1, 0]).to.eq(7)
      expect(tensor[1, 1, 1]).to.eq(8)
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
  }
}
