extension AST {
  public class FunctionInvocation: BaseNode {
    public let function: Function
    public var expressions = [String: ASTExpression]()

    public init(function: Function) {
      self.function = function
    }
  }
}
