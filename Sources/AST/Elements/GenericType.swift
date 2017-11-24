extension AST {
  public class GenericType {
    public let name: String
    public let extends: ASTType?

    public init(name: String, extends: ASTType? = nil) {
      self.name = name
      self.extends = extends
    }
  }
}
