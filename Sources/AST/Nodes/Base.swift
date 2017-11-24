fileprivate let singleIndent = "  "

extension AST {
  /// This is the base class for all AST nodes.
  public class BaseNode: ASTNode {
    func indentionString(indent: Int) -> String {
      guard indent > 0 else { return "" }
      return String(repeating: singleIndent, count: indent)
    }

    func code(nodes: [ASTNode], indent: Int) -> String {
      var code = ""
      for node in nodes {
        code.append(node.code(indent: indent))
        code.append("\n")
      }
      return code
    }

    public func code(indent: Int) -> String {
      fatalError("Child class should implement #code method")
    }
  }
}
