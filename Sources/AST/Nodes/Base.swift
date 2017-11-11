fileprivate let singleIndent = "  "

/// `ASTNode` is a general interface for code generation.
public protocol ASTNode {
  func code(indent: Int) -> String
}

/// Node which can be used as a child in `AST.SourceFile`.
public protocol ASTSourceFileChild: ASTNode {}

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
