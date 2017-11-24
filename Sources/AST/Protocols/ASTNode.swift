/// `ASTNode` is a general interface for code generation.
public protocol ASTNode {
  func code(indent: Int) -> String
}
