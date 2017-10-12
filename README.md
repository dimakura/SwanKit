# SwanKit

SwanKit is a framework for programming neural networks inspired by [Torch](http://torch.ch/).

It attempts to make deep learning more accessible for regular Mac users.

Initial goal is to implement it using [Metal Framework](https://developer.apple.com/metal/) for Mac and iOS.
A long-term goal is to use [CUDA](https://developer.nvidia.com/cuda-zone) for other platforms.

If you are interested to contribute, please check [here](./CONTRIBUTING.md).

[![Build Status](https://travis-ci.org/dimakura/SwanKit.svg?branch=master)](https://travis-ci.org/dimakura/SwanKit)

# Using SwanKit

## Tensors and operations

To create a tensor use `SWKTensor` class:

```swift
import SwanKit

let a = SWKTensor(2, 2)
let b = SWKTensor(content: [[1, 2], [3, 4]])
```

TODO: complete

## Computational graph and differentiation

TODO: complete

## Learning routines

TODO: complete
