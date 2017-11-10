extension AST {
  public class SourceFile: BaseNode {
    public let path: String
    var _children: [ASTSourceFileChild]

    public init(path: String) {
      self.path = path
      self._children = [ASTSourceFileChild]()
    }

    public func addChild(node: ASTSourceFileChild) {
      _children.append(node)
    }

    override public func code(indent: Int) -> String {
      return code(nodes: _children, indent: indent)
    }
  }
}
