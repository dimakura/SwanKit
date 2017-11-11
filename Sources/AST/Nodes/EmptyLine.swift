extension AST {
  public class EmptyLine: BaseNode, ASTSourceFileChild {
    let lines: Int

    public init(lines: Int = 1) {
      self.lines = lines > 1 ? lines : 1
    }

    override public func code(indent: Int) -> String {
      return lines == 1 ? "" : String(repeating: "\n", count: lines - 1)
    }
  }
}
