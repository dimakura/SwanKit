/// `SWKSize` describes tensor dimensionality.
public class SWKSize: SWKDimensional, CustomStringConvertible {
  /// Creates instance of `SWKSize`.
  /// This constructor cuts dimensions on first non-zero element.
  override public init(_ dimensions: [Int]) {
    let cutOnIndex = dimensions.index { x in x < 1 } ?? dimensions.count
    super.init(Array(dimensions[0..<cutOnIndex]))
  }

  /// Number of elements in tensor of this size.
  public var capacity: Int {
    return dimensions.isEmpty ? 0 : dimensions.reduce(1, *)
  }

  // TODO: specs
  /// Test if given indices are in tensor range.
  public func indexInRange(_ indices: [Int]) -> Bool {
    if indices.count != numberOfDimensions {
      return false
    }

    for (i, dimension) in indices.enumerated() {
      if dimension < 0 || dimension > dimensions[i] {
        return false
      }
    }

    return true
  }

  /// String representation.
  public var description: String {
    return dimensions.map {"\($0)"}.joined(separator: "x")
  }
}
