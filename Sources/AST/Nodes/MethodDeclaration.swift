extension AST {
  public class MethodDeclaration: BaseNode {
    public let method: Method
    public let body: MethodBody

    public init(method: Method, body: MethodBody) {
      self.method = method
      self.body = body
    }

    private func methodSignature() -> String {
      var signature = ""
      if method.visibility != .Default {
        signature.append(method.visibility.rawValue)
        signature.append(" ")
      }
      signature.append("func ")
      signature.append(method.name)
      // TODO: parameters
      signature.append("()")
      return signature
    }

    override public func code(indent: Int) -> String {
      var decl = indentionString(indent: indent)
      decl.append(methodSignature())
      // TODO: return type
      decl.append(" {}")
      return decl
    }
  }
}
