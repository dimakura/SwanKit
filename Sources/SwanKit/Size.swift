/// `SWKSize` describes tensor dimensionality.
///
/// ```swift
/// let size = SWKSize(5, 3)
/// size.capacity // 15
/// ````
public class SWKSize: CustomStringConvertible {
  /// Number of dimensions.
  public let numberOfDimensions: Int

  /// Dimensions for this size.
  public let dimensions: [Int]

  /// How many elements can tensor of this size contain?
  public let capacity: Int

  /// Creates instance of `SWKSize`.
  public init(_ dimensions: [Int]) {
    self.dimensions = cutDimensions(dimensions)
    capacity = self.dimensions.isEmpty ? 0 : self.dimensions.reduce(1, *)
    numberOfDimensions = self.dimensions.count
  }

  /// Creates instance of `SWKSize`.
  convenience public init(_ dimensions: Int...) {
    self.init(dimensions)
  }

  /// Empty size?
  public var isEmpty: Bool {
    return self.dimensions.isEmpty
  }

  /// Represent this size as a String.
  public var description: String {
    return dimensions.map({"\($0)"}).joined(separator: "x")
  }
}
