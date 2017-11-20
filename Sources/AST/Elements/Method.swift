extension AST {
  public class Method {
    public let name: String
    public var visibility: Visibility = .Default

    public init(name: String) {
      self.name = name
    }
  }
}
