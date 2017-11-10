extension AST {
  /// ```swift
  /// import Accelerate
  /// ```
  public class ImportStatement: BaseNode, ASTSourceFileChild {
    public let package: Package

    public init(package: Package) {
      self.package = package
    }

    override public func code(indent: Int) -> String {
      var statement = indentionString(indent: indent)
      statement.append("import ")
      statement.append(package.name)
      return statement
    }
  }
}
