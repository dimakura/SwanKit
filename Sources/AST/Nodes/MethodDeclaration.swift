extension AST {
  public class MethodDeclaration: BaseNode {
    public let method: Method
    public let body: MethodBody

    public init(method: Method, body: MethodBody) {
      self.method = method
      self.body = body
    }

    override public func code(indent: Int) -> String {
      var decl = indentionString(indent: indent)
      decl.append(method.signature)
      // TODO: body
      decl.append(" {}")
      return decl
    }
  }
}
