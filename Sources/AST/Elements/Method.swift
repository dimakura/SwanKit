extension AST {
  public class Method {
    public let name: String
    public var visibility: Visibility = .Default
    public var returnType: ASTType? = nil

    public init(name: String) {
      self.name = name
    }

    public var signature: String {
      var signature = ""
      if visibility != .Default {
        signature.append(visibility.rawValue)
        signature.append(" ")
      }
      signature.append("func ")
      signature.append(name)
      // TODO: parameters
      signature.append("()")
      if let type = returnType {
        signature.append(" -> ")
        signature.append(type.typeName())
      }
      return signature
    }
  }
}
