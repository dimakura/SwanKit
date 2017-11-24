extension AST {
  public class FunctionDeclaration: BaseNode {
    public let function: Function
    public let body: FunctionBody

    public init(function: Function, body: FunctionBody) {
      self.function = function
      self.body = body
    }

    override public func code(indent: Int) -> String {
      var decl = indentionString(indent: indent)
      decl.append(function.signature)
      decl.append(" {")
      // TODO: function body
      decl.append("}")
      return decl
    }
  }
}
