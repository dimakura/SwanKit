import AST

extension AST.ClassExtension {
  func addEqualityConstraint(_ generic: AST.GenericType, _ type: ASTType) {
    self.constraint = .Equality(generic, type)
  }
}
