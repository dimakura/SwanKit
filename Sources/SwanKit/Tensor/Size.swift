/// `SWKSize` describes tensor dimensionality.
///
/// ```swift
/// let size = SWKSize(5, 3)
/// size.capacity // 15
/// ````
public class SWKSize: CustomStringConvertible, Equatable {
  public static func == (lhs: SWKSize, rhs: SWKSize) -> Bool {
    return lhs.dimensions == rhs.dimensions
  }

  private var _dimensions: [Int]

  /// Number of elements this size can contain.
  public let capacity: Int

  /// Creates instance of `SWKSize`.
  /// This constructor cuts dimensions on the first non-zero item.
  public init(_ dimensions: [Int]) {
    let cutOnIndex = dimensions.index { x in x < 1 } ?? dimensions.count
    _dimensions = Array(dimensions[0..<cutOnIndex])
    capacity = _dimensions.isEmpty ? 0 : _dimensions.reduce(1, *)
  }

  /// Creates instance of `SWKSize`.
  convenience public init(_ dimensions: Int...) {
    self.init(dimensions)
  }

  /// Empty size?
  public var isEmpty: Bool {
    return _dimensions.isEmpty
  }

  /// Dimensions for this size.
  public var dimensions: [Int] {
    return _dimensions
  }

  /// Number of dimensions.
  public var numberOfDimensions: Int {
    return _dimensions.count
  }

  /// Transpose this size.
  public func transpose(dim1: Int = 0, dim2: Int = 1) {
    guard dim1 < numberOfDimensions && dim2 < numberOfDimensions && dim1 != dim2 else { return }

    let z = _dimensions[dim1]
    _dimensions[dim1] = _dimensions[dim2]
    _dimensions[dim2] = z
  }

  /// Represent this size as a String.
  public var description: String {
    return dimensions.map {"\($0)"}.joined(separator: "x")
  }
}
