extension AST {
  public class SourceFile: BaseNode {
    public let path: String
    public var children = [ASTSourceFileChild]()

    public init(path: String) {
      self.path = path
    }

    override public func code(indent: Int) -> String {
      return code(nodes: children, indent: indent)
    }
  }
}
