/// `SWKSize` describes tensor dimensionality.
public class SWKSize: SWKDimensinal, CustomStringConvertible {
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

  /// String representation.
  public var description: String {
    return dimensions.map {"\($0)"}.joined(separator: "x")
  }
}
