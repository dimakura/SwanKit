extension AST {
  public class Function: AST.BaseNode {
    public let name: String
    public let returnType: String?
    public var children = [ASTNode]()

    public init(name: String, returnType: String? = nil) {
      self.name = name
      self.returnType = returnType
    }

    override public func code(indent: Int) -> String {
      let lineIndent = indentionString(indent: indent)
      var function = lineIndent
      function.append("public func ")
      function.append(name)
      function.append("() ")
      if let returns = returnType {
        function.append("-> ")
        function.append(returns)
        function.append(" ")
      }
      function.append("{\n")
      function.append(code(nodes: children, indent: indent + 1))
      function.append(lineIndent)
      function.append("}\n")
      return function
    }
  }
}
