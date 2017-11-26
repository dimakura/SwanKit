fileprivate let singleIndent = "  "

public protocol ASTNode {
  func code(indent: Int) -> String
}

public struct AST {
  public class BaseNode: ASTNode {
    func indentionString(indent: Int) -> String {
      guard indent > 0 else { return "" }
      return String(repeating: singleIndent, count: indent)
    }

    func code(nodes: [ASTNode], indent: Int) -> String {
      var code = ""
      for node in nodes {
        code.append(node.code(indent: indent))
      }
      return code
    }

    public func code(indent: Int) -> String {
      fatalError("Child class should implement #code method")
    }
  }
}
