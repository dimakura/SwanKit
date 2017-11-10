fileprivate let singleIndent = "  "

fileprivate let linesBetweenNodes = [
  "Comment>ImportStatement": 1
]

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

    func linesBetween(node: ASTNode, next: ASTNode?) -> Int {
      guard let nextNode = next else { return 0 }
      let type1 = String(describing: type(of: node))
      let type2 = String(describing: type(of: nextNode))
      return linesBetweenNodes[type1 + ">" + type2] ?? 0
    }

    func code(nodes: [ASTNode], indent: Int) -> String {
      var code = ""
      for i in 0..<nodes.count {
        let node = nodes[i]
        let nextNode: ASTNode? = i + 1 < nodes.count ? nodes[i + 1] : nil
        let newLines = linesBetween(node: node, next: nextNode) + 1
        code.append(node.code(indent: indent))
        code.append(String(repeating: "\n", count: newLines))
      }
      return code
    }

    public func code(indent: Int) -> String {
      fatalError("Child class should implement #code method")
    }
  }
}
