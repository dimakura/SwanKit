extension AST {
  public class Parameter {
    let externalName: String?
    let name: String
    let type: ASTType

    public init(externalName: String? = nil, name: String, type: ASTType) {
      self.externalName = externalName
      self.name = name
      self.type = type
    }

    public var declaration: String {
      var param = ""
      if let extName = externalName {
        param.append(extName)
        param.append(" ")
      }
      param.append(self.name)
      param.append(": ")
      param.append(type.typeName())
      return param
    }
  }
}
