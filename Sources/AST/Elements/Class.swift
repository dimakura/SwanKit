extension AST {
  public class Class: ASTType {
    public let name: String
    public var types = [GenericType]()

    public init(name: String) {
      self.name = name
    }

    public var description: String {
      return name
    }
  }
}
