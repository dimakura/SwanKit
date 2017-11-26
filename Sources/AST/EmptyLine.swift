extension AST {
  public class EmptyLine: BaseNode {
    override public init() {}

    override public func code(indent: Int) -> String {
      return "\n"
    }
  }
}
