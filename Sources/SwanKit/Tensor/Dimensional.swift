/// Base class for dimensional objects like size and stride.
public class SWKDimensional: Equatable {
  /// If all dimensions are equal for two dimensional objects, they are equal.
  public static func == (lhs: SWKDimensional, rhs: SWKDimensional) -> Bool {
    return lhs.dimensions == rhs.dimensions
  }

  /// Internal dimensions variable.
  var _dimensions: [Int]

  /// Creates dimensional object.
  public init(_ dimensions: [Int]) {
    _dimensions = dimensions
  }

  /// Creates instance of `SWKSize`.
  convenience public init(_ dimensions: Int...) {
    self.init(dimensions)
  }

  /// Returns true if size has no dimensions.
  public var isEmpty: Bool {
    return _dimensions.isEmpty
  }

  /// Returns true if size has at least one dimension.
  public var isPresent: Bool {
    return !isEmpty
  }

  /// Object dimensions.
  public var dimensions: [Int] {
    return _dimensions
  }

  /// Number of dimensions.
  public var numberOfDimensions: Int {
    return _dimensions.count
  }

  /// Transpose this object along given dimensions.
  public func transpose(dim1: Int = 0, dim2: Int = 1) {
    guard dim1 < numberOfDimensions && dim2 < numberOfDimensions && dim1 != dim2 else { return }

    let z = _dimensions[dim1]
    _dimensions[dim1] = _dimensions[dim2]
    _dimensions[dim2] = z
  }
}
