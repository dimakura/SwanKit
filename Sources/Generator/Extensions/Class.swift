import AST

extension AST.Class {
  func addGeneric(_ name: String, _ extends: ASTType? = nil) -> AST.GenericType {
    let g = AST.GenericType(name: name, extends: extends)
    types.append(g)
    return g
  }
}
