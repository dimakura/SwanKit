extension AST {
  public class Function {
    public let name: String
    public var visibility: Visibility = .Default
    public var returnType: ASTType? = nil
    public var parameters = [Parameter]()

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
      signature.append("(")
      if !parameters.isEmpty {
        let parameterDeclarations = parameters.map { $0.declaration }.joined(separator: ", ")
        signature.append(parameterDeclarations)
      }
      signature.append(")")
      if let type = returnType {
        signature.append(" -> ")
        signature.append(type.typeName())
      }
      return signature
    }
  }
}
