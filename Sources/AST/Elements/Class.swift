extension AST {
  public class Class: ASTType {
    public let name: String
    public var types = [GenericType]()

    public init(name: String) {
      self.name = name
    }

    public func typeName() -> String {
      return name
    }
  }
}
