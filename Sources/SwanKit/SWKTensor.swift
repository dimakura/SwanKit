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
    _size = SWKSize(dimensions)
    _storage = SWKStorageBase<T>(_size.capacity)
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
