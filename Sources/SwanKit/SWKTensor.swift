//
// SwanKit
// SWKTensor.swift
//
// Created by Dimitri Kurashvili on 2017-10-15
//
// Copyright (c) 2017 Dimitri Kurashvili. All rights reserved
//

public class SWKTensorBase<T> {

  private var _size: SWKSize;
  private var _storage: SWKStorageBase<T>;

  public init(_ dimensions: Int...) {
    // TODO: assert all dimensions are > 0
    _size = SWKSize(dimensions)
    _storage = SWKStorageBase<T>(_size.capacity)
  }

  convenience public init(_ arr1: [T]) {
    self.init(arr1.count)
    // TODO: init storage
  }

  convenience public init(_ arr2: [[T]]) {
    self.init(arr2.count)
    // TODO: init storage
  }

  public subscript(index: Int...) -> T {
    fatalError("Not implemented", file: #file, line: #line)
  }

}

public typealias SWKByteTensor   = SWKTensorBase<Int8>
public typealias SWKShortTensor  = SWKTensorBase<Int16>
public typealias SWKIntTensor    = SWKTensorBase<Int32>
public typealias SWKLongTensor   = SWKTensorBase<Int64>
public typealias SWKFloatTensor  = SWKTensorBase<Float>
public typealias SWKDoubleTensor = SWKTensorBase<Double>
public typealias SWKTensor = SWKFloatTensor
