public protocol ASTExpression: ASTNode {
  func code() -> String
}
