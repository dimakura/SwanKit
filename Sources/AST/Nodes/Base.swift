fileprivate let singleIndent = "  "

/// AST node can generate code.
public protocol ASTNode {
  func code(indent: Int) -> String
}

extension AST {
  /// This is the base class for all AST nodes.
  public class BaseNode: ASTNode {
    func indentionString(indent: Int) -> String {
      guard indent > 0 else { return "" }
      return String(repeating: singleIndent, count: indent)
    }

    public func code(indent: Int) -> String {
      fatalError("Child class should implement #code method")
    }
  }
}
