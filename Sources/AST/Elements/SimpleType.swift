extension AST {
  public class SimpleType: ASTType {
    public let name: String
    public var generics = [GenericType]()

    public init(name: String) {
      self.name = name
    }

    public func typeName() -> String {
      var tname = name
      if !generics.isEmpty {
        tname.append("<")
        tname.append(generics.map { $0.name }.joined(separator: ", "))
        tname.append(">")
      }
      return tname
    }
  }
}
